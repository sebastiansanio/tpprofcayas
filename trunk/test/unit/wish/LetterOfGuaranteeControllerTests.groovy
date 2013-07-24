package wish



import org.junit.*
import grails.test.mixin.*

/**
 * LetterOfGuaranteeControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(LetterOfGuaranteeController)
@Mock(LetterOfGuarantee)
class LetterOfGuaranteeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/letterOfGuarantee/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.letterOfGuaranteeInstanceList.size() == 0
        assert model.letterOfGuaranteeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.letterOfGuaranteeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.letterOfGuaranteeInstance != null
        assert view == '/letterOfGuarantee/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/letterOfGuarantee/show/1'
        assert controller.flash.message != null
        assert LetterOfGuarantee.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/letterOfGuarantee/list'


        populateValidParams(params)
        def letterOfGuarantee = new LetterOfGuarantee(params)

        assert letterOfGuarantee.save() != null

        params.id = letterOfGuarantee.id

        def model = controller.show()

        assert model.letterOfGuaranteeInstance == letterOfGuarantee
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/letterOfGuarantee/list'


        populateValidParams(params)
        def letterOfGuarantee = new LetterOfGuarantee(params)

        assert letterOfGuarantee.save() != null

        params.id = letterOfGuarantee.id

        def model = controller.edit()

        assert model.letterOfGuaranteeInstance == letterOfGuarantee
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/letterOfGuarantee/list'

        response.reset()


        populateValidParams(params)
        def letterOfGuarantee = new LetterOfGuarantee(params)

        assert letterOfGuarantee.save() != null

        // test invalid parameters in update
        params.id = letterOfGuarantee.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/letterOfGuarantee/edit"
        assert model.letterOfGuaranteeInstance != null

        letterOfGuarantee.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/letterOfGuarantee/show/$letterOfGuarantee.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        letterOfGuarantee.clearErrors()

        populateValidParams(params)
        params.id = letterOfGuarantee.id
        params.version = -1
        controller.update()

        assert view == "/letterOfGuarantee/edit"
        assert model.letterOfGuaranteeInstance != null
        assert model.letterOfGuaranteeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/letterOfGuarantee/list'

        response.reset()

        populateValidParams(params)
        def letterOfGuarantee = new LetterOfGuarantee(params)

        assert letterOfGuarantee.save() != null
        assert LetterOfGuarantee.count() == 1

        params.id = letterOfGuarantee.id

        controller.delete()

        assert LetterOfGuarantee.count() == 0
        assert LetterOfGuarantee.get(letterOfGuarantee.id) == null
        assert response.redirectedUrl == '/letterOfGuarantee/list'
    }
}
