package prices



import org.junit.*
import grails.test.mixin.*

/**
 * CustomerGroupControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(CustomerGroupController)
@Mock(CustomerGroup)
class CustomerGroupControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/customerGroup/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.customerGroupInstanceList.size() == 0
        assert model.customerGroupInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.customerGroupInstance != null
    }

    void testSave() {
        controller.save()

        assert model.customerGroupInstance != null
        assert view == '/customerGroup/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/customerGroup/show/1'
        assert controller.flash.message != null
        assert CustomerGroup.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/customerGroup/list'


        populateValidParams(params)
        def customerGroup = new CustomerGroup(params)

        assert customerGroup.save() != null

        params.id = customerGroup.id

        def model = controller.show()

        assert model.customerGroupInstance == customerGroup
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/customerGroup/list'


        populateValidParams(params)
        def customerGroup = new CustomerGroup(params)

        assert customerGroup.save() != null

        params.id = customerGroup.id

        def model = controller.edit()

        assert model.customerGroupInstance == customerGroup
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/customerGroup/list'

        response.reset()


        populateValidParams(params)
        def customerGroup = new CustomerGroup(params)

        assert customerGroup.save() != null

        // test invalid parameters in update
        params.id = customerGroup.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/customerGroup/edit"
        assert model.customerGroupInstance != null

        customerGroup.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/customerGroup/show/$customerGroup.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        customerGroup.clearErrors()

        populateValidParams(params)
        params.id = customerGroup.id
        params.version = -1
        controller.update()

        assert view == "/customerGroup/edit"
        assert model.customerGroupInstance != null
        assert model.customerGroupInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/customerGroup/list'

        response.reset()

        populateValidParams(params)
        def customerGroup = new CustomerGroup(params)

        assert customerGroup.save() != null
        assert CustomerGroup.count() == 1

        params.id = customerGroup.id

        controller.delete()

        assert CustomerGroup.count() == 0
        assert CustomerGroup.get(customerGroup.id) == null
        assert response.redirectedUrl == '/customerGroup/list'
    }
}
