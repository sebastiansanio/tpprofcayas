package etc
import java.io.Serializable;

import org.hibernate.envers.EntityTrackingRevisionListener
import org.hibernate.envers.RevisionEntity;
import org.hibernate.envers.RevisionType;

import org.apache.shiro.SecurityUtils
import audit.RevisionDetail
import audit.RevisionInformation
import login.User
import org.apache.shiro.UnavailableSecurityManagerException

class ShiroRevisionListener implements EntityTrackingRevisionListener{
	public void newRevision(Object entity){
		RevisionInformation revisionEntity = (RevisionInformation) entity
		try{
			User user = User.findByUsername(SecurityUtils.getSubject().getPrincipal())
			revisionEntity.currentUser = user
		}catch(UnavailableSecurityManagerException ex){
			
		}
	}

	RevisionDetail retrieveRevisionDetail(RevisionInformation revision,String entityName,Long entityId){

		RevisionDetail detail = null
		revision.details.each{
			if(it.className == entityName && it.entityId == entityId)
				detail = it
		}
		return detail
	}
	
	@Override
	public void entityChanged(Class classArg, String entityName, Serializable entityId,
			RevisionType revisionType, Object revisionEntity) {
			
		RevisionInformation revisionInformation = (RevisionInformation) revisionEntity
		
		RevisionDetail detail = retrieveRevisionDetail(revisionInformation,entityName,entityId)
		if(detail==null){
			revisionInformation.addToDetails(new RevisionDetail(className:entityName,entityId:entityId,revisionType:revisionType))
		}else{
			if(detail.revisionType == RevisionType.MOD)
				detail.revisionType = revisionType
		
		}
		
	}
}
