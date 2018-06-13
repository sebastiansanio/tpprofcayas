package prices



import org.junit.*
import grails.test.mixin.*

/**
 * SupplierPriceCriteriaControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(SupplierPriceCriteriaController)
@Mock(SupplierPriceCriteria)
class SupplierPriceCriteriaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/supplierPriceCriteria/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.supplierPriceCriteriaInstanceList.size() == 0
        assert model.supplierPriceCriteriaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.supplierPriceCriteriaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.supplierPriceCriteriaInstance != null
        assert view == '/supplierPriceCriteria/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/supplierPriceCriteria/show/1'
        assert controller.flash.message != null
        assert SupplierPriceCriteria.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/supplierPriceCriteria/list'


        populateValidParams(params)
        def supplierPriceCriteria = new SupplierPriceCriteria(params)

        assert supplierPriceCriteria.save() != null

        params.id = supplierPriceCriteria.id

        def model = controller.show()

        assert model.supplierPriceCriteriaInstance == supplierPriceCriteria
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/supplierPriceCriteria/list'


        populateValidParams(params)
        def supplierPriceCriteria = new SupplierPriceCriteria(params)

        assert supplierPriceCriteria.save() != null

        params.id = supplierPriceCriteria.id

        def model = controller.edit()

        assert model.supplierPriceCriteriaInstance == supplierPriceCriteria
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/supplierPriceCriteria/list'

        response.reset()


        populateValidParams(params)
        def supplierPriceCriteria = new SupplierPriceCriteria(params)

        assert supplierPriceCriteria.save() != null

        // test invalid parameters in update
        params.id = supplierPriceCriteria.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/supplierPriceCriteria/edit"
        assert model.supplierPriceCriteriaInstance != null

        supplierPriceCriteria.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/supplierPriceCriteria/show/$supplierPriceCriteria.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        supplierPriceCriteria.clearErrors()

        populateValidParams(params)
        params.id = supplierPriceCriteria.id
        params.version = -1
        controller.update()

        assert view == "/supplierPriceCriteria/edit"
        assert model.supplierPriceCriteriaInstance != null
        assert model.supplierPriceCriteriaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/supplierPriceCriteria/list'

        response.reset()

        populateValidParams(params)
        def supplierPriceCriteria = new SupplierPriceCriteria(params)

        assert supplierPriceCriteria.save() != null
        assert SupplierPriceCriteria.count() == 1

        params.id = supplierPriceCriteria.id

        controller.delete()

        assert SupplierPriceCriteria.count() == 0
        assert SupplierPriceCriteria.get(supplierPriceCriteria.id) == null
        assert response.redirectedUrl == '/supplierPriceCriteria/list'
    }
}
