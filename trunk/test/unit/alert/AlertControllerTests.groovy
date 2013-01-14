package alert



import org.junit.*
import grails.test.mixin.*

/**
 * AlertControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(AlertController)
@Mock(Alert)
class AlertControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/alert/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.alertInstanceList.size() == 0
        assert model.alertInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.alertInstance != null
    }

    void testSave() {
        controller.save()

        assert model.alertInstance != null
        assert view == '/alert/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/alert/show/1'
        assert controller.flash.message != null
        assert Alert.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/alert/list'


        populateValidParams(params)
        def alert = new Alert(params)

        assert alert.save() != null

        params.id = alert.id

        def model = controller.show()

        assert model.alertInstance == alert
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/alert/list'


        populateValidParams(params)
        def alert = new Alert(params)

        assert alert.save() != null

        params.id = alert.id

        def model = controller.edit()

        assert model.alertInstance == alert
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/alert/list'

        response.reset()


        populateValidParams(params)
        def alert = new Alert(params)

        assert alert.save() != null

        // test invalid parameters in update
        params.id = alert.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/alert/edit"
        assert model.alertInstance != null

        alert.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/alert/show/$alert.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        alert.clearErrors()

        populateValidParams(params)
        params.id = alert.id
        params.version = -1
        controller.update()

        assert view == "/alert/edit"
        assert model.alertInstance != null
        assert model.alertInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/alert/list'

        response.reset()

        populateValidParams(params)
        def alert = new Alert(params)

        assert alert.save() != null
        assert Alert.count() == 1

        params.id = alert.id

        controller.delete()

        assert Alert.count() == 0
        assert Alert.get(alert.id) == null
        assert response.redirectedUrl == '/alert/list'
    }
}
