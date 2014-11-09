
<%@ page import="stakeholder.Customer" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
	<title><g:message code="View Photo" args="[entityName]" /></title>
</head>

<body>
	
<section id="viewPhoto-customer" class="first">
	<div id="myCarousel" class="carousel slide">  
            <!-- Carousel items -->  
		<div class="carousel-inner"> 

       			<g:each in="${pictureWish}" var="picture" status="i">	
					<g:if test="${i == 0}">
					     <div class="active item">
							<img src="${createLink(action: 'viewPicture',id: picture.id)}" width="300" height="300"/>
                   			<div class="carousel-caption">
								<p>${picture.description}</p>
							</div>
						</div>
					</g:if> 
					<g:else>
						<div class="item">
							<img src="${createLink(action: 'viewPicture',id: picture.id)}" width="300" height="300"/>
						    <div class="carousel-caption">
								<p>${picture.description}</p>
							</div>
						</div> 
					</g:else>
				</g:each>
		</div>  
  	<!-- Carousel nav -->  
  		<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>  
 		<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>  
	</div>  



</section>

</body>

</html>
