package wish



import org.junit.*
import grails.test.mixin.*

/**
 * SubtotalExtraControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(SubtotalExtraController)
@Mock(SubtotalExtra)
class SubtotalExtraControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subtotalExtra/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subtotalExtraInstanceList.size() == 0
        assert model.subtotalExtraInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.subtotalExtraInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subtotalExtraInstance != null
        assert view == '/subtotalExtra/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subtotalExtra/show/1'
        assert controller.flash.message != null
        assert SubtotalExtra.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subtotalExtra/list'


        populateValidParams(params)
        def subtotalExtra = new SubtotalExtra(params)

        assert subtotalExtra.save() != null

        params.id = subtotalExtra.id

        def model = controller.show()

        assert model.subtotalExtraInstance == subtotalExtra
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subtotalExtra/list'


        populateValidParams(params)
        def subtotalExtra = new SubtotalExtra(params)

        assert subtotalExtra.save() != null

        params.id = subtotalExtra.id

        def model = controller.edit()

        assert model.subtotalExtraInstance == subtotalExtra
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subtotalExtra/list'

        response.reset()


        populateValidParams(params)
        def subtotalExtra = new SubtotalExtra(params)

        assert subtotalExtra.save() != null

        // test invalid parameters in update
        params.id = subtotalExtra.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subtotalExtra/edit"
        assert model.subtotalExtraInstance != null

        subtotalExtra.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subtotalExtra/show/$subtotalExtra.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subtotalExtra.clearErrors()

        populateValidParams(params)
        params.id = subtotalExtra.id
        params.version = -1
        controller.update()

        assert view == "/subtotalExtra/edit"
        assert model.subtotalExtraInstance != null
        assert model.subtotalExtraInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subtotalExtra/list'

        response.reset()

        populateValidParams(params)
        def subtotalExtra = new SubtotalExtra(params)

        assert subtotalExtra.save() != null
        assert SubtotalExtra.count() == 1

        params.id = subtotalExtra.id

        controller.delete()

        assert SubtotalExtra.count() == 0
        assert SubtotalExtra.get(subtotalExtra.id) == null
        assert response.redirectedUrl == '/subtotalExtra/list'
    }
}
