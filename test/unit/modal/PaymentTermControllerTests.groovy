package modal



import org.junit.*
import grails.test.mixin.*

/**
 * PaymentTermControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(PaymentTermController)
@Mock(PaymentTerm)
class PaymentTermControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/paymentTerm/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.paymentTermInstanceList.size() == 0
        assert model.paymentTermInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.paymentTermInstance != null
    }

    void testSave() {
        controller.save()

        assert model.paymentTermInstance != null
        assert view == '/paymentTerm/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/paymentTerm/show/1'
        assert controller.flash.message != null
        assert PaymentTerm.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentTerm/list'


        populateValidParams(params)
        def paymentTerm = new PaymentTerm(params)

        assert paymentTerm.save() != null

        params.id = paymentTerm.id

        def model = controller.show()

        assert model.paymentTermInstance == paymentTerm
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentTerm/list'


        populateValidParams(params)
        def paymentTerm = new PaymentTerm(params)

        assert paymentTerm.save() != null

        params.id = paymentTerm.id

        def model = controller.edit()

        assert model.paymentTermInstance == paymentTerm
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentTerm/list'

        response.reset()


        populateValidParams(params)
        def paymentTerm = new PaymentTerm(params)

        assert paymentTerm.save() != null

        // test invalid parameters in update
        params.id = paymentTerm.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/paymentTerm/edit"
        assert model.paymentTermInstance != null

        paymentTerm.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/paymentTerm/show/$paymentTerm.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        paymentTerm.clearErrors()

        populateValidParams(params)
        params.id = paymentTerm.id
        params.version = -1
        controller.update()

        assert view == "/paymentTerm/edit"
        assert model.paymentTermInstance != null
        assert model.paymentTermInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/paymentTerm/list'

        response.reset()

        populateValidParams(params)
        def paymentTerm = new PaymentTerm(params)

        assert paymentTerm.save() != null
        assert PaymentTerm.count() == 1

        params.id = paymentTerm.id

        controller.delete()

        assert PaymentTerm.count() == 0
        assert PaymentTerm.get(paymentTerm.id) == null
        assert response.redirectedUrl == '/paymentTerm/list'
    }
}
