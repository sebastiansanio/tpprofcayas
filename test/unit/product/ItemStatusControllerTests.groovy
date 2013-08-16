package product



import org.junit.*
import grails.test.mixin.*

/**
 * ItemStateControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ItemStatusController)
@Mock(ItemStatus)
class ItemStatusControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/itemState/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.itemStateInstanceList.size() == 0
        assert model.itemStateInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.itemStateInstance != null
    }

    void testSave() {
        controller.save()

        assert model.itemStateInstance != null
        assert view == '/itemState/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/itemState/show/1'
        assert controller.flash.message != null
        assert ItemStatus.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/itemState/list'


        populateValidParams(params)
        def itemState = new ItemStatus(params)

        assert itemState.save() != null

        params.id = itemState.id

        def model = controller.show()

        assert model.itemStateInstance == itemState
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/itemState/list'


        populateValidParams(params)
        def itemState = new ItemStatus(params)

        assert itemState.save() != null

        params.id = itemState.id

        def model = controller.edit()

        assert model.itemStateInstance == itemState
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/itemState/list'

        response.reset()


        populateValidParams(params)
        def itemState = new ItemStatus(params)

        assert itemState.save() != null

        // test invalid parameters in update
        params.id = itemState.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/itemState/edit"
        assert model.itemStateInstance != null

        itemState.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/itemState/show/$itemState.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        itemState.clearErrors()

        populateValidParams(params)
        params.id = itemState.id
        params.version = -1
        controller.update()

        assert view == "/itemState/edit"
        assert model.itemStateInstance != null
        assert model.itemStateInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/itemState/list'

        response.reset()

        populateValidParams(params)
        def itemState = new ItemStatus(params)

        assert itemState.save() != null
        assert ItemStatus.count() == 1

        params.id = itemState.id

        controller.delete()

        assert ItemStatus.count() == 0
        assert ItemStatus.get(itemState.id) == null
        assert response.redirectedUrl == '/itemState/list'
    }
}
