package modal



import org.junit.*
import grails.test.mixin.*

/**
 * ShippingMarkControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ShippingMarkController)
@Mock(ShippingMark)
class ShippingMarkControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/shippingMark/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.shippingMarkInstanceList.size() == 0
        assert model.shippingMarkInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.shippingMarkInstance != null
    }

    void testSave() {
        controller.save()

        assert model.shippingMarkInstance != null
        assert view == '/shippingMark/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/shippingMark/show/1'
        assert controller.flash.message != null
        assert ShippingMark.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/shippingMark/list'


        populateValidParams(params)
        def shippingMark = new ShippingMark(params)

        assert shippingMark.save() != null

        params.id = shippingMark.id

        def model = controller.show()

        assert model.shippingMarkInstance == shippingMark
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/shippingMark/list'


        populateValidParams(params)
        def shippingMark = new ShippingMark(params)

        assert shippingMark.save() != null

        params.id = shippingMark.id

        def model = controller.edit()

        assert model.shippingMarkInstance == shippingMark
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/shippingMark/list'

        response.reset()


        populateValidParams(params)
        def shippingMark = new ShippingMark(params)

        assert shippingMark.save() != null

        // test invalid parameters in update
        params.id = shippingMark.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/shippingMark/edit"
        assert model.shippingMarkInstance != null

        shippingMark.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/shippingMark/show/$shippingMark.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        shippingMark.clearErrors()

        populateValidParams(params)
        params.id = shippingMark.id
        params.version = -1
        controller.update()

        assert view == "/shippingMark/edit"
        assert model.shippingMarkInstance != null
        assert model.shippingMarkInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/shippingMark/list'

        response.reset()

        populateValidParams(params)
        def shippingMark = new ShippingMark(params)

        assert shippingMark.save() != null
        assert ShippingMark.count() == 1

        params.id = shippingMark.id

        controller.delete()

        assert ShippingMark.count() == 0
        assert ShippingMark.get(shippingMark.id) == null
        assert response.redirectedUrl == '/shippingMark/list'
    }
}
