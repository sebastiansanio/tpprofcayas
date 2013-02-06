package modal



import org.junit.*
import grails.test.mixin.*

/**
 * PriceConditionControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(PriceConditionController)
@Mock(PriceCondition)
class PriceConditionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/priceCondition/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.priceConditionInstanceList.size() == 0
        assert model.priceConditionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.priceConditionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.priceConditionInstance != null
        assert view == '/priceCondition/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/priceCondition/show/1'
        assert controller.flash.message != null
        assert PriceCondition.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/priceCondition/list'


        populateValidParams(params)
        def priceCondition = new PriceCondition(params)

        assert priceCondition.save() != null

        params.id = priceCondition.id

        def model = controller.show()

        assert model.priceConditionInstance == priceCondition
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/priceCondition/list'


        populateValidParams(params)
        def priceCondition = new PriceCondition(params)

        assert priceCondition.save() != null

        params.id = priceCondition.id

        def model = controller.edit()

        assert model.priceConditionInstance == priceCondition
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/priceCondition/list'

        response.reset()


        populateValidParams(params)
        def priceCondition = new PriceCondition(params)

        assert priceCondition.save() != null

        // test invalid parameters in update
        params.id = priceCondition.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/priceCondition/edit"
        assert model.priceConditionInstance != null

        priceCondition.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/priceCondition/show/$priceCondition.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        priceCondition.clearErrors()

        populateValidParams(params)
        params.id = priceCondition.id
        params.version = -1
        controller.update()

        assert view == "/priceCondition/edit"
        assert model.priceConditionInstance != null
        assert model.priceConditionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/priceCondition/list'

        response.reset()

        populateValidParams(params)
        def priceCondition = new PriceCondition(params)

        assert priceCondition.save() != null
        assert PriceCondition.count() == 1

        params.id = priceCondition.id

        controller.delete()

        assert PriceCondition.count() == 0
        assert PriceCondition.get(priceCondition.id) == null
        assert response.redirectedUrl == '/priceCondition/list'
    }
}
