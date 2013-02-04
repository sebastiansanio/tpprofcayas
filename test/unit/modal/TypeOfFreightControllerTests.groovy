package modal



import org.junit.*
import grails.test.mixin.*

/**
 * TypeOfFreightControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(TypeOfFreightController)
@Mock(TypeOfFreight)
class TypeOfFreightControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/typeOfFreight/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.typeOfFreightInstanceList.size() == 0
        assert model.typeOfFreightInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.typeOfFreightInstance != null
    }

    void testSave() {
        controller.save()

        assert model.typeOfFreightInstance != null
        assert view == '/typeOfFreight/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/typeOfFreight/show/1'
        assert controller.flash.message != null
        assert TypeOfFreight.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/typeOfFreight/list'


        populateValidParams(params)
        def typeOfFreight = new TypeOfFreight(params)

        assert typeOfFreight.save() != null

        params.id = typeOfFreight.id

        def model = controller.show()

        assert model.typeOfFreightInstance == typeOfFreight
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/typeOfFreight/list'


        populateValidParams(params)
        def typeOfFreight = new TypeOfFreight(params)

        assert typeOfFreight.save() != null

        params.id = typeOfFreight.id

        def model = controller.edit()

        assert model.typeOfFreightInstance == typeOfFreight
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/typeOfFreight/list'

        response.reset()


        populateValidParams(params)
        def typeOfFreight = new TypeOfFreight(params)

        assert typeOfFreight.save() != null

        // test invalid parameters in update
        params.id = typeOfFreight.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/typeOfFreight/edit"
        assert model.typeOfFreightInstance != null

        typeOfFreight.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/typeOfFreight/show/$typeOfFreight.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        typeOfFreight.clearErrors()

        populateValidParams(params)
        params.id = typeOfFreight.id
        params.version = -1
        controller.update()

        assert view == "/typeOfFreight/edit"
        assert model.typeOfFreightInstance != null
        assert model.typeOfFreightInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/typeOfFreight/list'

        response.reset()

        populateValidParams(params)
        def typeOfFreight = new TypeOfFreight(params)

        assert typeOfFreight.save() != null
        assert TypeOfFreight.count() == 1

        params.id = typeOfFreight.id

        controller.delete()

        assert TypeOfFreight.count() == 0
        assert TypeOfFreight.get(typeOfFreight.id) == null
        assert response.redirectedUrl == '/typeOfFreight/list'
    }
}
