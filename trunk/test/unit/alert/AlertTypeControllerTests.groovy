package alert



import org.junit.*
import grails.test.mixin.*

/**
 * AlertTypeControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(AlertTypeController)
@Mock(AlertType)
class AlertTypeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/alertType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.alertTypeInstanceList.size() == 0
        assert model.alertTypeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.alertTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.alertTypeInstance != null
        assert view == '/alertType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/alertType/show/1'
        assert controller.flash.message != null
        assert AlertType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/alertType/list'


        populateValidParams(params)
        def alertType = new AlertType(params)

        assert alertType.save() != null

        params.id = alertType.id

        def model = controller.show()

        assert model.alertTypeInstance == alertType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/alertType/list'


        populateValidParams(params)
        def alertType = new AlertType(params)

        assert alertType.save() != null

        params.id = alertType.id

        def model = controller.edit()

        assert model.alertTypeInstance == alertType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/alertType/list'

        response.reset()


        populateValidParams(params)
        def alertType = new AlertType(params)

        assert alertType.save() != null

        // test invalid parameters in update
        params.id = alertType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/alertType/edit"
        assert model.alertTypeInstance != null

        alertType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/alertType/show/$alertType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        alertType.clearErrors()

        populateValidParams(params)
        params.id = alertType.id
        params.version = -1
        controller.update()

        assert view == "/alertType/edit"
        assert model.alertTypeInstance != null
        assert model.alertTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/alertType/list'

        response.reset()

        populateValidParams(params)
        def alertType = new AlertType(params)

        assert alertType.save() != null
        assert AlertType.count() == 1

        params.id = alertType.id

        controller.delete()

        assert AlertType.count() == 0
        assert AlertType.get(alertType.id) == null
        assert response.redirectedUrl == '/alertType/list'
    }
}
