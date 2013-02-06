package stakeholder



import org.junit.*
import grails.test.mixin.*

/**
 * ShipperControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ShipperController)
@Mock(Shipper)
class ShipperControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/shipper/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.shipperInstanceList.size() == 0
        assert model.shipperInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.shipperInstance != null
    }

    void testSave() {
        controller.save()

        assert model.shipperInstance != null
        assert view == '/shipper/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/shipper/show/1'
        assert controller.flash.message != null
        assert Shipper.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/shipper/list'


        populateValidParams(params)
        def shipper = new Shipper(params)

        assert shipper.save() != null

        params.id = shipper.id

        def model = controller.show()

        assert model.shipperInstance == shipper
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/shipper/list'


        populateValidParams(params)
        def shipper = new Shipper(params)

        assert shipper.save() != null

        params.id = shipper.id

        def model = controller.edit()

        assert model.shipperInstance == shipper
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/shipper/list'

        response.reset()


        populateValidParams(params)
        def shipper = new Shipper(params)

        assert shipper.save() != null

        // test invalid parameters in update
        params.id = shipper.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/shipper/edit"
        assert model.shipperInstance != null

        shipper.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/shipper/show/$shipper.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        shipper.clearErrors()

        populateValidParams(params)
        params.id = shipper.id
        params.version = -1
        controller.update()

        assert view == "/shipper/edit"
        assert model.shipperInstance != null
        assert model.shipperInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/shipper/list'

        response.reset()

        populateValidParams(params)
        def shipper = new Shipper(params)

        assert shipper.save() != null
        assert Shipper.count() == 1

        params.id = shipper.id

        controller.delete()

        assert Shipper.count() == 0
        assert Shipper.get(shipper.id) == null
        assert response.redirectedUrl == '/shipper/list'
    }
}
