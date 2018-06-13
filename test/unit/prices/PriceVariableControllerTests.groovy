package prices



import org.junit.*
import grails.test.mixin.*

/**
 * PriceVariableControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(PriceVariableController)
@Mock(PriceVariable)
class PriceVariableControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/priceVariable/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.priceVariableInstanceList.size() == 0
        assert model.priceVariableInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.priceVariableInstance != null
    }

    void testSave() {
        controller.save()

        assert model.priceVariableInstance != null
        assert view == '/priceVariable/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/priceVariable/show/1'
        assert controller.flash.message != null
        assert PriceVariable.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/priceVariable/list'


        populateValidParams(params)
        def priceVariable = new PriceVariable(params)

        assert priceVariable.save() != null

        params.id = priceVariable.id

        def model = controller.show()

        assert model.priceVariableInstance == priceVariable
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/priceVariable/list'


        populateValidParams(params)
        def priceVariable = new PriceVariable(params)

        assert priceVariable.save() != null

        params.id = priceVariable.id

        def model = controller.edit()

        assert model.priceVariableInstance == priceVariable
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/priceVariable/list'

        response.reset()


        populateValidParams(params)
        def priceVariable = new PriceVariable(params)

        assert priceVariable.save() != null

        // test invalid parameters in update
        params.id = priceVariable.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/priceVariable/edit"
        assert model.priceVariableInstance != null

        priceVariable.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/priceVariable/show/$priceVariable.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        priceVariable.clearErrors()

        populateValidParams(params)
        params.id = priceVariable.id
        params.version = -1
        controller.update()

        assert view == "/priceVariable/edit"
        assert model.priceVariableInstance != null
        assert model.priceVariableInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/priceVariable/list'

        response.reset()

        populateValidParams(params)
        def priceVariable = new PriceVariable(params)

        assert priceVariable.save() != null
        assert PriceVariable.count() == 1

        params.id = priceVariable.id

        controller.delete()

        assert PriceVariable.count() == 0
        assert PriceVariable.get(priceVariable.id) == null
        assert response.redirectedUrl == '/priceVariable/list'
    }
}
