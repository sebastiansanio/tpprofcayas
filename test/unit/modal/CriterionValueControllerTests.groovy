package modal



import org.junit.*
import grails.test.mixin.*

/**
 * CriterionValueControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(CriterionValueController)
@Mock(CriterionValue)
class CriterionValueControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/criterionValue/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.criterionValueInstanceList.size() == 0
        assert model.criterionValueInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.criterionValueInstance != null
    }

    void testSave() {
        controller.save()

        assert model.criterionValueInstance != null
        assert view == '/criterionValue/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/criterionValue/show/1'
        assert controller.flash.message != null
        assert CriterionValue.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/criterionValue/list'


        populateValidParams(params)
        def criterionValue = new CriterionValue(params)

        assert criterionValue.save() != null

        params.id = criterionValue.id

        def model = controller.show()

        assert model.criterionValueInstance == criterionValue
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/criterionValue/list'


        populateValidParams(params)
        def criterionValue = new CriterionValue(params)

        assert criterionValue.save() != null

        params.id = criterionValue.id

        def model = controller.edit()

        assert model.criterionValueInstance == criterionValue
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/criterionValue/list'

        response.reset()


        populateValidParams(params)
        def criterionValue = new CriterionValue(params)

        assert criterionValue.save() != null

        // test invalid parameters in update
        params.id = criterionValue.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/criterionValue/edit"
        assert model.criterionValueInstance != null

        criterionValue.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/criterionValue/show/$criterionValue.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        criterionValue.clearErrors()

        populateValidParams(params)
        params.id = criterionValue.id
        params.version = -1
        controller.update()

        assert view == "/criterionValue/edit"
        assert model.criterionValueInstance != null
        assert model.criterionValueInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/criterionValue/list'

        response.reset()

        populateValidParams(params)
        def criterionValue = new CriterionValue(params)

        assert criterionValue.save() != null
        assert CriterionValue.count() == 1

        params.id = criterionValue.id

        controller.delete()

        assert CriterionValue.count() == 0
        assert CriterionValue.get(criterionValue.id) == null
        assert response.redirectedUrl == '/criterionValue/list'
    }
}
