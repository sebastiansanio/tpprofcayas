package stakeholder



import org.junit.*
import grails.test.mixin.*

/**
 * AgentControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(AgentController)
@Mock(Agent)
class AgentControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/agent/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.agentInstanceList.size() == 0
        assert model.agentInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.agentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.agentInstance != null
        assert view == '/agent/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/agent/show/1'
        assert controller.flash.message != null
        assert Agent.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/agent/list'


        populateValidParams(params)
        def agent = new Agent(params)

        assert agent.save() != null

        params.id = agent.id

        def model = controller.show()

        assert model.agentInstance == agent
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/agent/list'


        populateValidParams(params)
        def agent = new Agent(params)

        assert agent.save() != null

        params.id = agent.id

        def model = controller.edit()

        assert model.agentInstance == agent
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/agent/list'

        response.reset()


        populateValidParams(params)
        def agent = new Agent(params)

        assert agent.save() != null

        // test invalid parameters in update
        params.id = agent.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/agent/edit"
        assert model.agentInstance != null

        agent.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/agent/show/$agent.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        agent.clearErrors()

        populateValidParams(params)
        params.id = agent.id
        params.version = -1
        controller.update()

        assert view == "/agent/edit"
        assert model.agentInstance != null
        assert model.agentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/agent/list'

        response.reset()

        populateValidParams(params)
        def agent = new Agent(params)

        assert agent.save() != null
        assert Agent.count() == 1

        params.id = agent.id

        controller.delete()

        assert Agent.count() == 0
        assert Agent.get(agent.id) == null
        assert response.redirectedUrl == '/agent/list'
    }
}
