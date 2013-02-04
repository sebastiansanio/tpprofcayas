package modal



import org.junit.*
import grails.test.mixin.*

/**
 * DocumentTypeControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(DocumentTypeController)
@Mock(DocumentType)
class DocumentTypeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/documentType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.documentTypeInstanceList.size() == 0
        assert model.documentTypeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.documentTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.documentTypeInstance != null
        assert view == '/documentType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/documentType/show/1'
        assert controller.flash.message != null
        assert DocumentType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/documentType/list'


        populateValidParams(params)
        def documentType = new DocumentType(params)

        assert documentType.save() != null

        params.id = documentType.id

        def model = controller.show()

        assert model.documentTypeInstance == documentType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/documentType/list'


        populateValidParams(params)
        def documentType = new DocumentType(params)

        assert documentType.save() != null

        params.id = documentType.id

        def model = controller.edit()

        assert model.documentTypeInstance == documentType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/documentType/list'

        response.reset()


        populateValidParams(params)
        def documentType = new DocumentType(params)

        assert documentType.save() != null

        // test invalid parameters in update
        params.id = documentType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/documentType/edit"
        assert model.documentTypeInstance != null

        documentType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/documentType/show/$documentType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        documentType.clearErrors()

        populateValidParams(params)
        params.id = documentType.id
        params.version = -1
        controller.update()

        assert view == "/documentType/edit"
        assert model.documentTypeInstance != null
        assert model.documentTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/documentType/list'

        response.reset()

        populateValidParams(params)
        def documentType = new DocumentType(params)

        assert documentType.save() != null
        assert DocumentType.count() == 1

        params.id = documentType.id

        controller.delete()

        assert DocumentType.count() == 0
        assert DocumentType.get(documentType.id) == null
        assert response.redirectedUrl == '/documentType/list'
    }
}
