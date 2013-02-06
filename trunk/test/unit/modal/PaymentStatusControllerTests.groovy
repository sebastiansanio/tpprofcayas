package modal



import org.junit.*
import grails.test.mixin.*

/**
 * PaymentStatusControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(PaymentStatusController)
@Mock(PaymentStatus)
class PaymentStatusControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/paymentStatus/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.paymentStatusInstanceList.size() == 0
        assert model.paymentStatusInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.paymentStatusInstance != null
    }

    void testSave() {
        controller.save()

        assert model.paymentStatusInstance != null
        assert view == '/paymentStatus/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/paymentStatus/show/1'
        assert controller.flash.message != null
        assert PaymentStatus.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentStatus/list'


        populateValidParams(params)
        def paymentStatus = new PaymentStatus(params)

        assert paymentStatus.save() != null

        params.id = paymentStatus.id

        def model = controller.show()

        assert model.paymentStatusInstance == paymentStatus
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentStatus/list'


        populateValidParams(params)
        def paymentStatus = new PaymentStatus(params)

        assert paymentStatus.save() != null

        params.id = paymentStatus.id

        def model = controller.edit()

        assert model.paymentStatusInstance == paymentStatus
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentStatus/list'

        response.reset()


        populateValidParams(params)
        def paymentStatus = new PaymentStatus(params)

        assert paymentStatus.save() != null

        // test invalid parameters in update
        params.id = paymentStatus.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/paymentStatus/edit"
        assert model.paymentStatusInstance != null

        paymentStatus.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/paymentStatus/show/$paymentStatus.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        paymentStatus.clearErrors()

        populateValidParams(params)
        params.id = paymentStatus.id
        params.version = -1
        controller.update()

        assert view == "/paymentStatus/edit"
        assert model.paymentStatusInstance != null
        assert model.paymentStatusInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/paymentStatus/list'

        response.reset()

        populateValidParams(params)
        def paymentStatus = new PaymentStatus(params)

        assert paymentStatus.save() != null
        assert PaymentStatus.count() == 1

        params.id = paymentStatus.id

        controller.delete()

        assert PaymentStatus.count() == 0
        assert PaymentStatus.get(paymentStatus.id) == null
        assert response.redirectedUrl == '/paymentStatus/list'
    }
}
