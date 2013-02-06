package modal



import org.junit.*
import grails.test.mixin.*

/**
 * WishStatusControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(WishStatusController)
@Mock(WishStatus)
class WishStatusControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/wishStatus/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.wishStatusInstanceList.size() == 0
        assert model.wishStatusInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.wishStatusInstance != null
    }

    void testSave() {
        controller.save()

        assert model.wishStatusInstance != null
        assert view == '/wishStatus/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/wishStatus/show/1'
        assert controller.flash.message != null
        assert WishStatus.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/wishStatus/list'


        populateValidParams(params)
        def wishStatus = new WishStatus(params)

        assert wishStatus.save() != null

        params.id = wishStatus.id

        def model = controller.show()

        assert model.wishStatusInstance == wishStatus
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/wishStatus/list'


        populateValidParams(params)
        def wishStatus = new WishStatus(params)

        assert wishStatus.save() != null

        params.id = wishStatus.id

        def model = controller.edit()

        assert model.wishStatusInstance == wishStatus
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/wishStatus/list'

        response.reset()


        populateValidParams(params)
        def wishStatus = new WishStatus(params)

        assert wishStatus.save() != null

        // test invalid parameters in update
        params.id = wishStatus.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/wishStatus/edit"
        assert model.wishStatusInstance != null

        wishStatus.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/wishStatus/show/$wishStatus.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        wishStatus.clearErrors()

        populateValidParams(params)
        params.id = wishStatus.id
        params.version = -1
        controller.update()

        assert view == "/wishStatus/edit"
        assert model.wishStatusInstance != null
        assert model.wishStatusInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/wishStatus/list'

        response.reset()

        populateValidParams(params)
        def wishStatus = new WishStatus(params)

        assert wishStatus.save() != null
        assert WishStatus.count() == 1

        params.id = wishStatus.id

        controller.delete()

        assert WishStatus.count() == 0
        assert WishStatus.get(wishStatus.id) == null
        assert response.redirectedUrl == '/wishStatus/list'
    }
}
