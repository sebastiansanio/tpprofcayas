
<%@ page import="product.PriceList" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
    <g:set var="entityName" value="${message(code: 'priceList.label', default: 'PriceList')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
    
<section id="list-historical" class="first">

    <h4><g:message code="historicalPrice.description.label" default="Description"/></h4> 

    <table class="table table-hover">
        <tbody>

            <tr class="prop">
                <td valign="top" class="name"> <g:message code="supplier.label"/> </td>
                
                <td valign="top" style="text-align: right;" class="value"> ${priceList.supplier} </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name"> <g:message code="priceList.label"/> </td>
                
                <td valign="top" style="text-align: right;" class="value"> ${priceList} </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name"> <g:message code="product.label"/> </td>
                
                <td valign="top" style="text-align: right;" class="value"> <strong>${product}</strong> </td>
            </tr>
        </tbody>
    </table>

    <h4><g:message code="historicalPrice.label"/></h4> 

    <table class="table table-hover">
        <thead>
            <tr>
                <th><g:message code="product.pricePerUnit.label" default="Price"/></th>
            
                <th><g:message code="priceList.dateFrom.label" default="Date From"/></th>
            </tr>
        </thead>
        <tbody>
        <g:each in="${historicalInstanceList}" status="i" var="hp">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            
                <td>${hp.price}</td>

                <td>${hp.dateFrom}</td>
                            
            </tr>
        </g:each>
        </tbody>
    </table>
</section>

</body>

</html>