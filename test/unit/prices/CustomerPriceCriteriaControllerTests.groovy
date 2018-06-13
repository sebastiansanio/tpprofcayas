package prices



import org.junit.*
import grails.test.mixin.*

/**
 * CustomerPriceCriteriaControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(CustomerPriceCriteriaController)
@Mock(CustomerPriceCriteria)
class CustomerPriceCriteriaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/customerPriceCriteria/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.customerPriceCriteriaInstanceList.size() == 0
        assert model.customerPriceCriteriaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.customerPriceCriteriaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.customerPriceCriteriaInstance != null
        assert view == '/customerPriceCriteria/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/customerPriceCriteria/show/1'
        assert controller.flash.message != null
        assert CustomerPriceCriteria.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/customerPriceCriteria/list'


        populateValidParams(params)
        def customerPriceCriteria = new CustomerPriceCriteria(params)

        assert customerPriceCriteria.save() != null

        params.id = customerPriceCriteria.id

        def model = controller.show()

        assert model.customerPriceCriteriaInstance == customerPriceCriteria
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/customerPriceCriteria/list'


        populateValidParams(params)
        def customerPriceCriteria = new CustomerPriceCriteria(params)

        assert customerPriceCriteria.save() != null

        params.id = customerPriceCriteria.id

        def model = controller.edit()

        assert model.customerPriceCriteriaInstance == customerPriceCriteria
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/customerPriceCriteria/list'

        response.reset()


        populateValidParams(params)
        def customerPriceCriteria = new CustomerPriceCriteria(params)

        assert customerPriceCriteria.save() != null

        // test invalid parameters in update
        params.id = customerPriceCriteria.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/customerPriceCriteria/edit"
        assert model.customerPriceCriteriaInstance != null

        customerPriceCriteria.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/customerPriceCriteria/show/$customerPriceCriteria.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        customerPriceCriteria.clearErrors()

        populateValidParams(params)
        params.id = customerPriceCriteria.id
        params.version = -1
        controller.update()

        assert view == "/customerPriceCriteria/edit"
        assert model.customerPriceCriteriaInstance != null
        assert model.customerPriceCriteriaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/customerPriceCriteria/list'

        response.reset()

        populateValidParams(params)
        def customerPriceCriteria = new CustomerPriceCriteria(params)

        assert customerPriceCriteria.save() != null
        assert CustomerPriceCriteria.count() == 1

        params.id = customerPriceCriteria.id

        controller.delete()

        assert CustomerPriceCriteria.count() == 0
        assert CustomerPriceCriteria.get(customerPriceCriteria.id) == null
        assert response.redirectedUrl == '/customerPriceCriteria/list'
    }
}
