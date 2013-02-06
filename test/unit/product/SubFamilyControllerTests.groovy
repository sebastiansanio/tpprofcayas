package product



import org.junit.*
import grails.test.mixin.*

/**
 * SubFamilyControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(SubFamilyController)
@Mock(SubFamily)
class SubFamilyControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subFamily/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subFamilyInstanceList.size() == 0
        assert model.subFamilyInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.subFamilyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subFamilyInstance != null
        assert view == '/subFamily/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subFamily/show/1'
        assert controller.flash.message != null
        assert SubFamily.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subFamily/list'


        populateValidParams(params)
        def subFamily = new SubFamily(params)

        assert subFamily.save() != null

        params.id = subFamily.id

        def model = controller.show()

        assert model.subFamilyInstance == subFamily
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subFamily/list'


        populateValidParams(params)
        def subFamily = new SubFamily(params)

        assert subFamily.save() != null

        params.id = subFamily.id

        def model = controller.edit()

        assert model.subFamilyInstance == subFamily
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subFamily/list'

        response.reset()


        populateValidParams(params)
        def subFamily = new SubFamily(params)

        assert subFamily.save() != null

        // test invalid parameters in update
        params.id = subFamily.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subFamily/edit"
        assert model.subFamilyInstance != null

        subFamily.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subFamily/show/$subFamily.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subFamily.clearErrors()

        populateValidParams(params)
        params.id = subFamily.id
        params.version = -1
        controller.update()

        assert view == "/subFamily/edit"
        assert model.subFamilyInstance != null
        assert model.subFamilyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subFamily/list'

        response.reset()

        populateValidParams(params)
        def subFamily = new SubFamily(params)

        assert subFamily.save() != null
        assert SubFamily.count() == 1

        params.id = subFamily.id

        controller.delete()

        assert SubFamily.count() == 0
        assert SubFamily.get(subFamily.id) == null
        assert response.redirectedUrl == '/subFamily/list'
    }
}
