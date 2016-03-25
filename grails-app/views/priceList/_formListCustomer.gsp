<%@ page import="product.PriceList" %>
<%@ page import="stakeholder.Supplier" %>

<h5><g:message code="supplier.add.priceList.label" default="Price List" /></h5>

<div class="control-group fieldcontain ${hasErrors(bean: stakeholderInstance, field: 'priceLists', 'error')} ">

  <table class="table table-hover">
    <thead>
      <tr>
        <th>${message(code: 'supplier.label', default: 'Supplier')} <span class="required-indicator">*</span> </th>
        <th>${message(code: 'priceList.label', default: 'Price list')} <span class="required-indicator">*</span></th>
        <th> </th>
      </tr>
    </thead>
    <tbody id="priceListTable">
      <g:each in="${stakeholderInstance?.priceLists?.sort{ it.supplier?.toString()}}" var="priceListInstance" status="i">
        <tr class="list-name">
          <td>
            <g:select class="supplier" name="supplier.id" from="${Supplier.list().sort{it.name}}" optionKey="id" required="" value="${priceListInstance?.supplier?.id}" class="supplier"/>
            <span class="help-inline">${hasErrors(bean: priceListInstance, field: 'name', 'error')}</span>
          </td>
    
          <td> 
            <g:select class='priceList' name="priceLists" from="${priceListInstance?.supplier?.priceLists}.sort{it.name}" optionKey="id" required="" value="${priceListInstance?.id}"/>
          </td>
          
          <td> 
            <g:if test="${!priceListInstance.id}">
              <a role="button" class="btn btn-small btn-primary btnDel-priceList" data-index="${i}"><i class="icon-trash"></i></a>
            </g:if>
            <g:else>
              <a href="#modalDeleteList" role="button" class="btn btn-small btn-primary btn-modal-delete-list" data-index="${priceListInstance.id}" data-toggle="modal"> <i class="icon-trash"></i> </a>            
            </g:else>
          </td>
        </tr>
      </g:each>
    </tbody>
  </table>
</div>

<a id="addPriceList" role="button" class="btn btn-small btn-primary"> ${message(code: 'supplier.add.priceList.label', default: 'Add price list')}</a>

<script type="text/javascript">
jQuery(document).ready(function($) {
    var priceList = $("#priceListTable").find('.list-name').length;
    var supplier;

    var askSupplier = function() {
        $.ajax({
            url: "${createLink( controller:'priceList', action:'getAllSuppliers' )}",
            type: 'GET',
            dataType: 'json',
            success: function( data, textStatus, jqXHR ) {
                if ( 'suppliers' in data ) {
                    supplier = data['suppliers']; 
                }
            },
            error: function( jqXHR, textStatus, errorThrown ) {
                console.log("error al pedir los proveedores");
                alert('Error al pedir los proveedores');
            }
        });
    }

    var addSupplierInView = function( selectSupplier ) {
        var option;
        for (var i = 0; i < supplier.length; i++) {
            option = "<option value='" + supplier[i].id + "'>"+ supplier[i].description +"</option>";
            selectSupplier.append(option);
        }
    }

    var askPriceList = function( selectSupplier, selectPriceList ) {
        var idSupplier = selectSupplier.val();
        selectPriceList.empty();
        $.ajax({
            url: '${createLink(controller:"priceList", action: "getPricesList")}',
            type: 'GET',
            dataType: 'json',
            data: {idSupplier: idSupplier},
            success: function( data, textStatus, jqXHR ) {
                var option;
                if ( 'pricesList' in data ) {
                    for (var i = 0; i < data['pricesList'].length; i++) {
                      console.log(data['pricesList'][i].id);
                        option = "<option value='" + data['pricesList'][i].id+ "'>" + data['pricesList'][i].description + "</option>";
                        selectPriceList.append(option);
                    }
                }
            },
            error: function( jqXHR, textStatus, errorThrown ) {
                console.log("Error al pedir las listas de precios");
                alert('Error al pedir las listas de precios');
            }
        })
    }
    askSupplier();

    $('body').on('click', '#addPriceList', function(event) {
        event.preventDefault();
        var numberList = $('.priceList').length;
        var supplierSelect = "<select class='supplier' required></select>";
        var priceListSelect = "<select class='priceList' name='priceLists' required></select>";
        var enlace =  '<a role="button" class="btn btn-small btn-primary btnDel-priceList" data-index="' + priceList + '"><i class="icon-trash"></i></a>';
        var row = "<tr class='list-name'> \
                    <td> " + supplierSelect + " </td>\
                    <td> " + priceListSelect + " </td>\
                    <td> " + enlace + " </td>\
                   </tr>";
        $('#priceListTable').append(row);
        addSupplierInView( $('#priceListTable select.supplier').last() );
        priceList++;
        askPriceList( $('#priceListTable select.supplier').last(), $('#priceListTable select.priceList').last() );
    });

    $("#priceListTable").on('click', '.btn-modal-delete-list', function(event) {
      var listId = $(this).data("index");
      $("#nroPriceListDelete").val(listId);
    });


    $('body').on('click', '.btnDel-priceList', function(event) {
        event.preventDefault();
        var container = $(this).closest('tr');
        var index =  parseInt($(this).data('index'));
        var regExp = /[\d]+/i;
        var priceListSelect, oldName, enlace;

        container.nextAll().each(function(i, el) {
            priceListSelect = $(el).find('select.priceList');
            enlace = $(el).find('a');
            oldName = priceListSelect.attr('name');
            priceListSelect.attr('name', oldName.replace(regExp, index));
            enlace.data('index', index);
            index++;
        });

        container.remove();
        priceList--;
    });

    $('body').on('change', 'select.supplier', function(event) {
        var selectPriceList = $(this).closest('tr').find('select.priceList');
        askPriceList( $(this), selectPriceList );
    });
});
</script>