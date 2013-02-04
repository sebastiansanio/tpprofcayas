package modal



import org.junit.*
import grails.test.mixin.*

/**
 * PortControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(PortController)
@Mock(Port)
class PortControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/port/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.portInstanceList.size() == 0
        assert model.portInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.portInstance != null
    }

    void testSave() {
        controller.save()

        assert model.portInstance != null
        assert view == '/port/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/port/show/1'
        assert controller.flash.message != null
        assert Port.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/port/list'


        populateValidParams(params)
        def port = new Port(params)

        assert port.save() != null

        params.id = port.id

        def model = controller.show()

        assert model.portInstance == port
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/port/list'


        populateValidParams(params)
        def port = new Port(params)

        assert port.save() != null

        params.id = port.id

        def model = controller.edit()

        assert model.portInstance == port
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/port/list'

        response.reset()


        populateValidParams(params)
        def port = new Port(params)

        assert port.save() != null

        // test invalid parameters in update
        params.id = port.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/port/edit"
        assert model.portInstance != null

        port.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/port/show/$port.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        port.clearErrors()

        populateValidParams(params)
        params.id = port.id
        params.version = -1
        controller.update()

        assert view == "/port/edit"
        assert model.portInstance != null
        assert model.portInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/port/list'

        response.reset()

        populateValidParams(params)
        def port = new Port(params)

        assert port.save() != null
        assert Port.count() == 1

        params.id = port.id

        controller.delete()

        assert Port.count() == 0
        assert Port.get(port.id) == null
        assert response.redirectedUrl == '/port/list'
    }
}
