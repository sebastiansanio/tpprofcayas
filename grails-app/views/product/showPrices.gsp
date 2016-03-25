
<%@ page import="product.PriceList" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
    <g:set var="entityName" value="${message(code: 'prices.label', default: 'Prices')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-priceList" class="first">

  <h4>${message(code: 'product.label', default: 'Product')}: <small>${product}</small></h4>

  <table class="table table-hover">
    <thead>
      <th><g:message code="price.label" default="Price"/></th>
      <th><g:message code="supplier.label" default="Supplier"/></th> 
      <th><g:message code="priceList.label" default="List"/></th>  
    </thead>
    <tbody>
      <g:each in="${productPrices.sort{it.price}}" var="p">

        <tr class="prop">
          <td valign="top" class="value"> ${p.price} </td>
          <td valign="top" class="value"> ${p.list.supplier} </td>
          <td valign="top" class="value"> ${p.list} </td>
        </tr>
      </g:each>
    </tbody>
  </table>
        
</section>

</body>

</html>
