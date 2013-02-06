package stakeholder



import org.junit.*
import grails.test.mixin.*

/**
 * ForwarderControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ForwarderController)
@Mock(Forwarder)
class ForwarderControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/forwarder/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.forwarderInstanceList.size() == 0
        assert model.forwarderInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.forwarderInstance != null
    }

    void testSave() {
        controller.save()

        assert model.forwarderInstance != null
        assert view == '/forwarder/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/forwarder/show/1'
        assert controller.flash.message != null
        assert Forwarder.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/forwarder/list'


        populateValidParams(params)
        def forwarder = new Forwarder(params)

        assert forwarder.save() != null

        params.id = forwarder.id

        def model = controller.show()

        assert model.forwarderInstance == forwarder
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/forwarder/list'


        populateValidParams(params)
        def forwarder = new Forwarder(params)

        assert forwarder.save() != null

        params.id = forwarder.id

        def model = controller.edit()

        assert model.forwarderInstance == forwarder
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/forwarder/list'

        response.reset()


        populateValidParams(params)
        def forwarder = new Forwarder(params)

        assert forwarder.save() != null

        // test invalid parameters in update
        params.id = forwarder.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/forwarder/edit"
        assert model.forwarderInstance != null

        forwarder.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/forwarder/show/$forwarder.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        forwarder.clearErrors()

        populateValidParams(params)
        params.id = forwarder.id
        params.version = -1
        controller.update()

        assert view == "/forwarder/edit"
        assert model.forwarderInstance != null
        assert model.forwarderInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/forwarder/list'

        response.reset()

        populateValidParams(params)
        def forwarder = new Forwarder(params)

        assert forwarder.save() != null
        assert Forwarder.count() == 1

        params.id = forwarder.id

        controller.delete()

        assert Forwarder.count() == 0
        assert Forwarder.get(forwarder.id) == null
        assert response.redirectedUrl == '/forwarder/list'
    }
}
