package product



import org.junit.*
import grails.test.mixin.*

/**
 * FamilyControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(FamilyController)
@Mock(Family)
class FamilyControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/family/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.familyInstanceList.size() == 0
        assert model.familyInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.familyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.familyInstance != null
        assert view == '/family/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/family/show/1'
        assert controller.flash.message != null
        assert Family.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/family/list'


        populateValidParams(params)
        def family = new Family(params)

        assert family.save() != null

        params.id = family.id

        def model = controller.show()

        assert model.familyInstance == family
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/family/list'


        populateValidParams(params)
        def family = new Family(params)

        assert family.save() != null

        params.id = family.id

        def model = controller.edit()

        assert model.familyInstance == family
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/family/list'

        response.reset()


        populateValidParams(params)
        def family = new Family(params)

        assert family.save() != null

        // test invalid parameters in update
        params.id = family.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/family/edit"
        assert model.familyInstance != null

        family.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/family/show/$family.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        family.clearErrors()

        populateValidParams(params)
        params.id = family.id
        params.version = -1
        controller.update()

        assert view == "/family/edit"
        assert model.familyInstance != null
        assert model.familyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/family/list'

        response.reset()

        populateValidParams(params)
        def family = new Family(params)

        assert family.save() != null
        assert Family.count() == 1

        params.id = family.id

        controller.delete()

        assert Family.count() == 0
        assert Family.get(family.id) == null
        assert response.redirectedUrl == '/family/list'
    }
}
