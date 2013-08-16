package product



import org.junit.*
import grails.test.mixin.*

/**
 * TypeOfPresentationControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(TypeOfPresentationController)
@Mock(TypeOfPresentation)
class TypeOfPresentationControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/typeOfPresentation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.typeOfPresentationInstanceList.size() == 0
        assert model.typeOfPresentationInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.typeOfPresentationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.typeOfPresentationInstance != null
        assert view == '/typeOfPresentation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/typeOfPresentation/show/1'
        assert controller.flash.message != null
        assert TypeOfPresentation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/typeOfPresentation/list'


        populateValidParams(params)
        def typeOfPresentation = new TypeOfPresentation(params)

        assert typeOfPresentation.save() != null

        params.id = typeOfPresentation.id

        def model = controller.show()

        assert model.typeOfPresentationInstance == typeOfPresentation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/typeOfPresentation/list'


        populateValidParams(params)
        def typeOfPresentation = new TypeOfPresentation(params)

        assert typeOfPresentation.save() != null

        params.id = typeOfPresentation.id

        def model = controller.edit()

        assert model.typeOfPresentationInstance == typeOfPresentation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/typeOfPresentation/list'

        response.reset()


        populateValidParams(params)
        def typeOfPresentation = new TypeOfPresentation(params)

        assert typeOfPresentation.save() != null

        // test invalid parameters in update
        params.id = typeOfPresentation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/typeOfPresentation/edit"
        assert model.typeOfPresentationInstance != null

        typeOfPresentation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/typeOfPresentation/show/$typeOfPresentation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        typeOfPresentation.clearErrors()

        populateValidParams(params)
        params.id = typeOfPresentation.id
        params.version = -1
        controller.update()

        assert view == "/typeOfPresentation/edit"
        assert model.typeOfPresentationInstance != null
        assert model.typeOfPresentationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/typeOfPresentation/list'

        response.reset()

        populateValidParams(params)
        def typeOfPresentation = new TypeOfPresentation(params)

        assert typeOfPresentation.save() != null
        assert TypeOfPresentation.count() == 1

        params.id = typeOfPresentation.id

        controller.delete()

        assert TypeOfPresentation.count() == 0
        assert TypeOfPresentation.get(typeOfPresentation.id) == null
        assert response.redirectedUrl == '/typeOfPresentation/list'
    }
}
