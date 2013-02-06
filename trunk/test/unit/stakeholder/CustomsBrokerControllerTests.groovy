package stakeholder



import org.junit.*
import grails.test.mixin.*

/**
 * CustomsBrokerControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(CustomsBrokerController)
@Mock(CustomsBroker)
class CustomsBrokerControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/customsBroker/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.customsBrokerInstanceList.size() == 0
        assert model.customsBrokerInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.customsBrokerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.customsBrokerInstance != null
        assert view == '/customsBroker/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/customsBroker/show/1'
        assert controller.flash.message != null
        assert CustomsBroker.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/customsBroker/list'


        populateValidParams(params)
        def customsBroker = new CustomsBroker(params)

        assert customsBroker.save() != null

        params.id = customsBroker.id

        def model = controller.show()

        assert model.customsBrokerInstance == customsBroker
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/customsBroker/list'


        populateValidParams(params)
        def customsBroker = new CustomsBroker(params)

        assert customsBroker.save() != null

        params.id = customsBroker.id

        def model = controller.edit()

        assert model.customsBrokerInstance == customsBroker
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/customsBroker/list'

        response.reset()


        populateValidParams(params)
        def customsBroker = new CustomsBroker(params)

        assert customsBroker.save() != null

        // test invalid parameters in update
        params.id = customsBroker.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/customsBroker/edit"
        assert model.customsBrokerInstance != null

        customsBroker.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/customsBroker/show/$customsBroker.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        customsBroker.clearErrors()

        populateValidParams(params)
        params.id = customsBroker.id
        params.version = -1
        controller.update()

        assert view == "/customsBroker/edit"
        assert model.customsBrokerInstance != null
        assert model.customsBrokerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/customsBroker/list'

        response.reset()

        populateValidParams(params)
        def customsBroker = new CustomsBroker(params)

        assert customsBroker.save() != null
        assert CustomsBroker.count() == 1

        params.id = customsBroker.id

        controller.delete()

        assert CustomsBroker.count() == 0
        assert CustomsBroker.get(customsBroker.id) == null
        assert response.redirectedUrl == '/customsBroker/list'
    }
}
