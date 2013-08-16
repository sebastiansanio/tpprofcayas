package product



import org.junit.*
import grails.test.mixin.*

/**
 * ItemUnitControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ItemUnitController)
@Mock(ItemUnit)
class ItemUnitControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/itemUnit/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.itemUnitInstanceList.size() == 0
        assert model.itemUnitInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.itemUnitInstance != null
    }

    void testSave() {
        controller.save()

        assert model.itemUnitInstance != null
        assert view == '/itemUnit/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/itemUnit/show/1'
        assert controller.flash.message != null
        assert ItemUnit.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/itemUnit/list'


        populateValidParams(params)
        def itemUnit = new ItemUnit(params)

        assert itemUnit.save() != null

        params.id = itemUnit.id

        def model = controller.show()

        assert model.itemUnitInstance == itemUnit
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/itemUnit/list'


        populateValidParams(params)
        def itemUnit = new ItemUnit(params)

        assert itemUnit.save() != null

        params.id = itemUnit.id

        def model = controller.edit()

        assert model.itemUnitInstance == itemUnit
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/itemUnit/list'

        response.reset()


        populateValidParams(params)
        def itemUnit = new ItemUnit(params)

        assert itemUnit.save() != null

        // test invalid parameters in update
        params.id = itemUnit.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/itemUnit/edit"
        assert model.itemUnitInstance != null

        itemUnit.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/itemUnit/show/$itemUnit.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        itemUnit.clearErrors()

        populateValidParams(params)
        params.id = itemUnit.id
        params.version = -1
        controller.update()

        assert view == "/itemUnit/edit"
        assert model.itemUnitInstance != null
        assert model.itemUnitInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/itemUnit/list'

        response.reset()

        populateValidParams(params)
        def itemUnit = new ItemUnit(params)

        assert itemUnit.save() != null
        assert ItemUnit.count() == 1

        params.id = itemUnit.id

        controller.delete()

        assert ItemUnit.count() == 0
        assert ItemUnit.get(itemUnit.id) == null
        assert response.redirectedUrl == '/itemUnit/list'
    }
}
