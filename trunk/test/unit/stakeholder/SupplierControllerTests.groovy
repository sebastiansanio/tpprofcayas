package stakeholder



import org.junit.*
import grails.test.mixin.*

/**
 * SupplierControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(SupplierController)
@Mock(Supplier)
class SupplierControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/supplier/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.supplierInstanceList.size() == 0
        assert model.supplierInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.supplierInstance != null
    }

    void testSave() {
        controller.save()

        assert model.supplierInstance != null
        assert view == '/supplier/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/supplier/show/1'
        assert controller.flash.message != null
        assert Supplier.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/supplier/list'


        populateValidParams(params)
        def supplier = new Supplier(params)

        assert supplier.save() != null

        params.id = supplier.id

        def model = controller.show()

        assert model.supplierInstance == supplier
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/supplier/list'


        populateValidParams(params)
        def supplier = new Supplier(params)

        assert supplier.save() != null

        params.id = supplier.id

        def model = controller.edit()

        assert model.supplierInstance == supplier
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/supplier/list'

        response.reset()


        populateValidParams(params)
        def supplier = new Supplier(params)

        assert supplier.save() != null

        // test invalid parameters in update
        params.id = supplier.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/supplier/edit"
        assert model.supplierInstance != null

        supplier.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/supplier/show/$supplier.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        supplier.clearErrors()

        populateValidParams(params)
        params.id = supplier.id
        params.version = -1
        controller.update()

        assert view == "/supplier/edit"
        assert model.supplierInstance != null
        assert model.supplierInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/supplier/list'

        response.reset()

        populateValidParams(params)
        def supplier = new Supplier(params)

        assert supplier.save() != null
        assert Supplier.count() == 1

        params.id = supplier.id

        controller.delete()

        assert Supplier.count() == 0
        assert Supplier.get(supplier.id) == null
        assert response.redirectedUrl == '/supplier/list'
    }
}
