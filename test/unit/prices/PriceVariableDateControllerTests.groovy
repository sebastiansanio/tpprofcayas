package prices



import org.junit.*
import grails.test.mixin.*

/**
 * PriceVariableDateControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(PriceVariableDateController)
@Mock(PriceVariableDate)
class PriceVariableDateControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/priceVariableDate/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.priceVariableDateInstanceList.size() == 0
        assert model.priceVariableDateInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.priceVariableDateInstance != null
    }

    void testSave() {
        controller.save()

        assert model.priceVariableDateInstance != null
        assert view == '/priceVariableDate/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/priceVariableDate/show/1'
        assert controller.flash.message != null
        assert PriceVariableDate.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/priceVariableDate/list'


        populateValidParams(params)
        def priceVariableDate = new PriceVariableDate(params)

        assert priceVariableDate.save() != null

        params.id = priceVariableDate.id

        def model = controller.show()

        assert model.priceVariableDateInstance == priceVariableDate
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/priceVariableDate/list'


        populateValidParams(params)
        def priceVariableDate = new PriceVariableDate(params)

        assert priceVariableDate.save() != null

        params.id = priceVariableDate.id

        def model = controller.edit()

        assert model.priceVariableDateInstance == priceVariableDate
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/priceVariableDate/list'

        response.reset()


        populateValidParams(params)
        def priceVariableDate = new PriceVariableDate(params)

        assert priceVariableDate.save() != null

        // test invalid parameters in update
        params.id = priceVariableDate.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/priceVariableDate/edit"
        assert model.priceVariableDateInstance != null

        priceVariableDate.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/priceVariableDate/show/$priceVariableDate.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        priceVariableDate.clearErrors()

        populateValidParams(params)
        params.id = priceVariableDate.id
        params.version = -1
        controller.update()

        assert view == "/priceVariableDate/edit"
        assert model.priceVariableDateInstance != null
        assert model.priceVariableDateInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/priceVariableDate/list'

        response.reset()

        populateValidParams(params)
        def priceVariableDate = new PriceVariableDate(params)

        assert priceVariableDate.save() != null
        assert PriceVariableDate.count() == 1

        params.id = priceVariableDate.id

        controller.delete()

        assert PriceVariableDate.count() == 0
        assert PriceVariableDate.get(priceVariableDate.id) == null
        assert response.redirectedUrl == '/priceVariableDate/list'
    }
}
