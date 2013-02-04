package modal



import org.junit.*
import grails.test.mixin.*

/**
 * ShipControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ShipController)
@Mock(Ship)
class ShipControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ship/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.shipInstanceList.size() == 0
        assert model.shipInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.shipInstance != null
    }

    void testSave() {
        controller.save()

        assert model.shipInstance != null
        assert view == '/ship/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ship/show/1'
        assert controller.flash.message != null
        assert Ship.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ship/list'


        populateValidParams(params)
        def ship = new Ship(params)

        assert ship.save() != null

        params.id = ship.id

        def model = controller.show()

        assert model.shipInstance == ship
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ship/list'


        populateValidParams(params)
        def ship = new Ship(params)

        assert ship.save() != null

        params.id = ship.id

        def model = controller.edit()

        assert model.shipInstance == ship
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ship/list'

        response.reset()


        populateValidParams(params)
        def ship = new Ship(params)

        assert ship.save() != null

        // test invalid parameters in update
        params.id = ship.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ship/edit"
        assert model.shipInstance != null

        ship.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ship/show/$ship.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ship.clearErrors()

        populateValidParams(params)
        params.id = ship.id
        params.version = -1
        controller.update()

        assert view == "/ship/edit"
        assert model.shipInstance != null
        assert model.shipInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ship/list'

        response.reset()

        populateValidParams(params)
        def ship = new Ship(params)

        assert ship.save() != null
        assert Ship.count() == 1

        params.id = ship.id

        controller.delete()

        assert Ship.count() == 0
        assert Ship.get(ship.id) == null
        assert response.redirectedUrl == '/ship/list'
    }
}
