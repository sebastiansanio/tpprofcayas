package etc
import org.hibernate.envers.RevisionListener

import org.apache.shiro.SecurityUtils
import audit.RevisionInformation
import login.User
import org.apache.shiro.UnavailableSecurityManagerException

class ShiroRevisionListener implements RevisionListener{
	public void newRevision(Object entity){
		RevisionInformation revisionEntity = (RevisionInformation) entity
		try{
			User user = User.findByUsername(SecurityUtils.getSubject().getPrincipal())
			revisionEntity.currentUser = user
		}catch(UnavailableSecurityManagerException ex){
			
		}
	}

}
