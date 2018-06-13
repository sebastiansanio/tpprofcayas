package prices



import org.junit.*
import grails.test.mixin.*

/**
 * ExchangeRateControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ExchangeRateController)
@Mock(ExchangeRate)
class ExchangeRateControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/exchangeRate/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.exchangeRateInstanceList.size() == 0
        assert model.exchangeRateInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.exchangeRateInstance != null
    }

    void testSave() {
        controller.save()

        assert model.exchangeRateInstance != null
        assert view == '/exchangeRate/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/exchangeRate/show/1'
        assert controller.flash.message != null
        assert ExchangeRate.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/exchangeRate/list'


        populateValidParams(params)
        def exchangeRate = new ExchangeRate(params)

        assert exchangeRate.save() != null

        params.id = exchangeRate.id

        def model = controller.show()

        assert model.exchangeRateInstance == exchangeRate
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/exchangeRate/list'


        populateValidParams(params)
        def exchangeRate = new ExchangeRate(params)

        assert exchangeRate.save() != null

        params.id = exchangeRate.id

        def model = controller.edit()

        assert model.exchangeRateInstance == exchangeRate
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/exchangeRate/list'

        response.reset()


        populateValidParams(params)
        def exchangeRate = new ExchangeRate(params)

        assert exchangeRate.save() != null

        // test invalid parameters in update
        params.id = exchangeRate.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/exchangeRate/edit"
        assert model.exchangeRateInstance != null

        exchangeRate.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/exchangeRate/show/$exchangeRate.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        exchangeRate.clearErrors()

        populateValidParams(params)
        params.id = exchangeRate.id
        params.version = -1
        controller.update()

        assert view == "/exchangeRate/edit"
        assert model.exchangeRateInstance != null
        assert model.exchangeRateInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/exchangeRate/list'

        response.reset()

        populateValidParams(params)
        def exchangeRate = new ExchangeRate(params)

        assert exchangeRate.save() != null
        assert ExchangeRate.count() == 1

        params.id = exchangeRate.id

        controller.delete()

        assert ExchangeRate.count() == 0
        assert ExchangeRate.get(exchangeRate.id) == null
        assert response.redirectedUrl == '/exchangeRate/list'
    }
}
