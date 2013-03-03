package modal



import org.junit.*
import grails.test.mixin.*

/**
 * AvailableLocaleControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(AvailableLocaleController)
@Mock(AvailableLocale)
class AvailableLocaleControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/availableLocale/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.availableLocaleInstanceList.size() == 0
        assert model.availableLocaleInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.availableLocaleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.availableLocaleInstance != null
        assert view == '/availableLocale/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/availableLocale/show/1'
        assert controller.flash.message != null
        assert AvailableLocale.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/availableLocale/list'


        populateValidParams(params)
        def availableLocale = new AvailableLocale(params)

        assert availableLocale.save() != null

        params.id = availableLocale.id

        def model = controller.show()

        assert model.availableLocaleInstance == availableLocale
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/availableLocale/list'


        populateValidParams(params)
        def availableLocale = new AvailableLocale(params)

        assert availableLocale.save() != null

        params.id = availableLocale.id

        def model = controller.edit()

        assert model.availableLocaleInstance == availableLocale
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/availableLocale/list'

        response.reset()


        populateValidParams(params)
        def availableLocale = new AvailableLocale(params)

        assert availableLocale.save() != null

        // test invalid parameters in update
        params.id = availableLocale.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/availableLocale/edit"
        assert model.availableLocaleInstance != null

        availableLocale.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/availableLocale/show/$availableLocale.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        availableLocale.clearErrors()

        populateValidParams(params)
        params.id = availableLocale.id
        params.version = -1
        controller.update()

        assert view == "/availableLocale/edit"
        assert model.availableLocaleInstance != null
        assert model.availableLocaleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/availableLocale/list'

        response.reset()

        populateValidParams(params)
        def availableLocale = new AvailableLocale(params)

        assert availableLocale.save() != null
        assert AvailableLocale.count() == 1

        params.id = availableLocale.id

        controller.delete()

        assert AvailableLocale.count() == 0
        assert AvailableLocale.get(availableLocale.id) == null
        assert response.redirectedUrl == '/availableLocale/list'
    }
}
