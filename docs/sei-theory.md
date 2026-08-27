# Software architecture theory (SEI)

Reference notes on software architecture: the definition of architecture, the
quality attributes, general scenarios, architectural tactics and patterns, and
documenting architectures with views and viewpoints. Source material follows
Bass, Clements & Kazman — *Software Architecture in Practice* (SEI series) and
the IEEE 2000 / ISO/IEC/IEEE 42010 recommended practice for architectural
description.

## Definition

The software architecture of a system is the set of structures needed to reason
about the system, which comprises software elements, relations among them, and
the properties of both.

Introduction
TDT4240 is a very interesting subject. The main project in this subject is about making a simple multiplayer mobile game. To prepare for the exam you need to learn how to design software architectures in detail. The book is recommended since it is very understandable and most of the figures in the presentation slides are taken from the book.

Glossary
Module	Code that together serves some functionality X.
Component	Two or more modules that serve some services Y
System	"A collection of components organized to accomplish a specific function or set of functions." (From the 2000 IEEE-standard, see the section at the end of this article)
Architectural description (AD)	"A collection of products to document an architecture" (IEEE, 2000)
Architecture	The software architecture of a system is the set of structures needed to reason about the system, which comprises software elements, relations among them, and properties of both.
Pattern	"[..] Usually describes software abstractions used by advanced designers and programmers in their software. [..] It can be applied to both the thing (for example, a collection class and its associated iterator) and the directions for making a thing." - Coplien J. (1998)
Architectural pattern	A composition of architectural elements providing packaged strategies for solving some of the problems facing a system.
Design patterns	A pattern that can be used for solving a problem in a subsystem, or a coding problem in a module.
View	"A representation of a whole system from the perspective of a related set of concerns" (IEEE, 2000) E.g. a logical view and a development view of the system.
Viewpoint	"A specification of the conventions for constructing and using a view. A pattern or template from which to develop individual views by establishing the purposes and audience for a view and the techniques for its creation and analysis." (IEEE, 2000)
This means the architectural patterns are at a higher level than the design patterns.

Why is Software Architecture important?
An architecture will inhibit or enable a system's driving quality attributes.
The decisions made in an architecture allow you to reason about and manage change as the system evolves.
The analysis of an architecture enables early prediction of a system's qualities.
A documented architecture enhances communication among stakeholders.
The architecture is a carrier of the earliest and hence most fundamental, hardest-to-change design decisions.
An architecture defines a set of constraints on subsequent implementation.
The architecture dictates the structure of an organization or vice versa.
An architecture can provide the basis for evolutionary prototyping.
An architecture is the key artifact that allows the architect and project manager to reason about cost and schedule.
An architecture can be created as a transferable, reusable model that forms the heart of a product line.
Architecture-based development focuses attention on the assembly of components, rather than simply on their creation.
By restricting design alternatives, architecture channels the creativity of developers, reducing design and system complexity.
An architecture can be the foundation for training a new team member.
Contexts of software architecture
Architectures exist in four different contexts:

Technical - What technical role does the software architecture play in the system or systems of which it's a part? The technical context includes the achievement of quality attribute requirements, as well as current technology (cloud, mobile computing, etc.).
Project life cycle - How does a software architecture relate to the other phases of a software development life cycle?

Business - How does the presence of a software architecture affect an organization's business environment? The system created must satisfy the business goals of a wide variety of stakeholders, each of whom has different expectations for the system.

Professional - What is the role of a software architect in an organization or a development project? You must have certain skills and knowledge to be an architect, and there are certain duties that you must perform as an architect. These are influenced not only by coursework and reading but also by your experiences.
Architectural patterns
An architectural pattern is a composition of elements to solve particular problems. It defines the element types and their forms of interaction used when solving the problems.

Module Patterns
Shows a set of code or data units that has to be constructed or procured.

Layered Pattern
Software is divided into layers that can be developed simultaneously. Layers are always drawn as a stack of boxes. All layers can use the public interfaces of the other layers (layer bridging).

Component-and-Connector Patterns
The element type is elements that have runtime behaviour(components) and their interactions(connectors).

Broker Pattern
The broker pattern solves the problem of having many services distributed among multiple servers. It sets a broker between the client and the servers. The broker forwards the client to the correct server and the servers respond to the client that ordered it.

Model-View-Controller Pattern
We want a way to keep the user interface separate from the application's functionality. We divide the software into a model with the application data, a view that displays it and a controller that manages the notifications of state changes.

Model	An object for saving data. It usually represents some sort of object, e.g. a user. The model must have methods to read and write the attributes, and also be able to fire change events.
View	A view is shown to the user. It reads and visualizes data.
Controller	Logic. Interprets input and manipulates/updates data.
MVC

Pipe-and-Filter Pattern
Software needed is supposed to transform streams of data multiple times. The solution is a pipeline with filters, altering the data in the correct order.

Client-Server Pattern
Shared resources and services need to be easily accessed and we have a large number of clients. Clients request services from servers. Note that some components can be both clients and servers.

Peer-to-Peer Pattern
When we have a set of distributed computational entities that are equally important, peer-to-peer (aka P2P) really shines. Peer-to-peer is typically a request-reply system. A peers search for another is often directed through peers in the middle, thus forming a swarm. An often well-known example is bittorrenting where peers share files with one another, often used for piracy.

Service-Oriented Pattern
A service provider needs to provide easily accessible services for its users. The consumers don't need to know anything about the implementation. Components have interfaces that describe the services they provide. Often multilanguage.

Publish-Subscribe Pattern
Components work together via announced messages or events, using an event bus. Components may subscribe to a set of events. Any component may be both publisher and subscriber.

NOTE: In Publisher/Subscriber - because of the event bus in between - components are loosely coupled as opposed to Observer pattern.

Shared-Data Pattern
Shared data between multiple data accessors and shared data stores. The connector enables data reading and writing to these stores.

Allocation Patterns
Relates non-software structures in its environment(such as CPUs, file systems, networks, etc.)

Map-Reduce Pattern
Satisfies the need to quickly analyze enormous volumes of data. Often sorting data and then analyze is insufficient. The map-reduce pattern needs specialized hardware for parallelization, and the functions map and reduce.

Multi-Tier Pattern
Describes how to distribute and allocate the components of a system in distinct subsets of hardware and software, connected by some communication medium. This pattern specializes in the generic deployment (software-to-hardware allocation) structure.

Design patterns
Creational patterns
Singleton pattern
A class is only instantiated once and can be changed by everyone. The constructor is private, so the object will only be created inside the class. It is important that we can retrieve the instance created from outside the class. A singleton pattern is not necessarily optimized for multithreading.

Factory pattern
Is used to encapsulate a set of objects, so that you can use them without having to specify the exact class of each object It can be done by either defining an interface, implemented in the child classes, or it can be defined in one class and overridden in the derived classes.

An example is to have a button factory so that when you're drawing a GUI you don't have to enter all the specifics of each button, but have a factory that takes care of all the specifics for you.

Abstract factory pattern
Here we encapsulate multiple factories made based on the factory pattern in a complete abstract factory.

TODO: explanation needs to be simpler
The abstract factory pattern creates an abstract factory with some general properties. We then make factories for each of these properties. Each of these factories makes an interface able to generate our instance of for example shape in the figure below

Abstract factory pattern

An example is an abstract GUIFactory, which can create different buttons through factories. The buttons are different, but the developer can work with them as they're all equal, through a more general type button than the specific buttons.

Alternative example:

Imagine having to connect to a database. In doing so you will need to configure a connection object, set a request timeout, a connection string, etc. Instead of doing this manually, you want a Factory (see factory pattern) that creates a connection for you. Because you are using MySQL you create a MySQLConnectionFactory. This works for now, but suddenly you want to support Oracle SQL server. In order to support different factories creating different types of connections, you create an AbstractSQLConnectionFactory, which both MySQLConnectionFactory and OracleSQLConnectionFactory can inherit or implement. Now you can program against the AbstractSQLFactory and change factory at runtime.

Behavioral patterns
Observer pattern
The observer pattern relies on an observer that gets its information from a subject and notifies its subclasses to update their state. This differs from the model view controller which is an architectural design, system-wide pattern.

Example: a program taking an integer and presenting it in different numeral systems. A subclass notifies the observer that an integer has been entered, the observer notifies all subclasses, in our example the octal, binary, and hexa- classes. Then they update their state accordingly.

State pattern
The state pattern has an interface class that defines a set of methods, and values of the class that should be available in all states of the class. The methods and values would vary depending on the state of the class.

Example: You have an ATM that has several states defined by the interface ATMstate. The states might be NoCard, CardInserted, and PinEntered. The class contains the methods insertCard(), removeCard(), and enterPin(int enteredPin).

The initial state is set to NoCard. In this state insertCard() would change the state to CardInserted, removeCard() and enterPin() would not do anything in this state, as there is no card.

When the state is set to CardInserted, insertCard() would return an error, as there is already a card inserted. removeCard() would switch the state back to NoCard. insertPin(pin) would switch the state to PinEntered if the pin was correct, and from there one would be able to withdraw money or check balance.

Methods for balance and withdrawal could be part of the interface and should probably return error messages if not in the PinEntered state.

Structural patterns
Template pattern
In java term (might want to generalize this a bit more), we have an abstract parent class thus it cannot be instantiated. It is extended by child classes inheriting its properties.

Example: The Zoo animals A zoo animal is a class containing legs, methods for feeding. That is inherited by elephants, dogs, etc... Dogs and elephants eat different things, so we initialize the actual methods in dogs and elephants class. The abstract class says that dogs and elephants (all zoo animals) have to be fed.

Quality Attributes (Chapters 5 - 12)
Testable property of a system to tell how well the system is satisfying the needs of the stakeholders. The attributes hold three types of categories:

Functional Requirements: What the system must do and how it must behave or react.
Quality Attribute Requirements: Qualification of functional requirements. For instance how fast a function must perform.
Constraints: Design decision with zero degrees of freedom. For instance the use of a certain programming language.
Availability
It refers to the property of software that is there and ready to carry out its task when it is needed. It encompasses both reliability and dependability.

Reliability	Delivers data to the right recipient at the right time.
Dependability	"The ability to avoid failures that are more frequent and more severe than acceptable." - Avizienis
This means that availability is about detecting and preventing faults, but also recovering from them. The book points out that one could say "failure is not an option", but that it is a lousy design philosophy as it would not work in practice.

The term "high availability" typically refers to "5 nine"-availability (99.999 % availability) or higher, which translates to 1 minute and 18 seconds of downtime over 90 days, or 5 minutes and 15 seconds over a year.

General scenario
Source of stimulus	Hardware
Stimulus	Failure
Artifacts	Harddisk on server
Environment	Normal operation
Response	Backup server takes over
Response measure	Back to normal operation after 30 s
Tactics
The goal of these tactics is to mask or repair the fault.

Figure 5.5 from Bassman-Clements-Kazman describing availability tactics.

Detect faults

Monitor	A component monitors all services and reports inconsistencies
Heartbeat	Periodic message exchange between a system monitor and a process being monitored.
Sanity checking	Checks validity or how reasonable the output from a component
Condition monitoring	Checks conditions in a process, or device or validating assumptions made during the design. Implemented with e.g. checksums.
Voting	Most common realization of the tactic is called triple modular redundancy (TMR). It has three components that do the same thing. They all receive the same input and forward the same output to a voting logic. The voting logic will compare the outputs, and report failure if there are any inconsistencies
Replication	Have multiple copies of a component. Effective against hardware failure.
Recover from faults

Preparation and repair	
Active Redundancy (hot spare)	All nodes in a protection group receive and process identical inputs in parallel, allowing redundant spare(s) to maintain synchronous state with the active node(s).
Passive Redundancy (warm spare)	Only the active members of the protection group process input traffic; one of their duties is to provide the redundant spare(s) with periodic state updates
Spare (cold spare)	Redundant spares of a protection group remain out of service until a fail-over occurs, at which point a power-on-reset procedure is initiated on the redundant spare prior to its being placed in service
Exception Handling	Dealing with the exception by reporting it or handling it, potentially masking the fault by correcting the cause of the exception and retrying
Rollback	Revert to a previous known good state, referred to as the “rollback line”
Software Upgrade	In-service upgrades to executable code images in a non-service-affecting manner
Retry	where failure is transient retrying the operation may lead to success
Ignore Faulty Behaviour	Ignoring messages sent from a source when it is determined that those messages are spurious
Degradation	Maintains the most critical system functions in the presence of component failures, dropping less critical functions
Reconfiguration	Reassigning responsibilities to the resources left functioning while maintaining as much functionality as possible
Reintroduction	
Shadow	Operating a previously failed or in-service upgraded component in a “shadow mode” for a predefined time prior to reverting the component back to an active role
State Resynchronization	Partner to active redundancy and passive redundancy where state information is sent from active to standby components
Escalating Restart	Recover from faults by varying the granularity of the component(s) restarted and minimizing the level of service affected
Non-Stop Forwarding	Functionality is split into supervisory and data. If a supervisor fails, a router continues forwarding packets along known routes while protocol information is recovered and validated
Prevent faults

Removal from Service	Temporarily placing a system component in an out-of-service state for the purpose of mitigating potential system failures
Transaction	Bundling state updates so that asynchronous messages exchanged between distributed components are atomic, consistent, isolated, and durable
Predictive Model	Monitor the state of health of a process to ensure that the system is operating within nominal parameters; take corrective action when conditions are detected that are predictive of likely future faults
Exception Prevention	Preventing system exceptions from occurring by masking a fault, or preventing it via smart pointers, abstract data types, wrappers
Increase Competence Set	Designing a component to handle more cases—faults—as part of its normal operation
Interoperability
Interoperability is about the degree to which two or more systems can usefully exchange meaningful information via interfaces in a particular context.

It includes:

Syntactic interoperability	The ability to exchange data.
Semantic interoperability	The ability to correctly interpret the data being exchanged.
A system cannot be interoperable in isolation. They can interoperate in indirect ways.

Reasons you would want interoperability in your system:

Your system provides a service to be used by other (unknown) systems
Your system constructs capabilities from existing systems.
These reasons give us two important aspects of interoperability:

Discovery	The system/consumer of some service has to know (discover) the location, identity and interface of the service to be used. This may be done during runtime, or prior to runtime.
Handling of the response	The service can either: Report back with a response, broadcast the response or send the response to another system.
One also has to manage available interfaces.

General scenario
Source of stimulus	A system that initiates a request.
Stimulus	request to exchange information among systems
Artifacts	The systems that wish to interoperate
Environment	The systems that wish to interoperate are discovered at runtime/prior to runtime
Response	The result, where it is sent. The request could also be rejected. In either case, the result may be logged.
Response measure	Percentage of information exchanges correctly processed, or the percentage correctly rejected.
See the example on page 107, figure 6.1.

Tactics
Figure 6.3 from the book.

Locate

Discover service	Locate a service by searching a known directory service.
Manage interfaces

Orchestrate	Uses a control mechanism to coordinate, manage and sequence the invocation of services.
Tailor interface	Adds or removes capabilities to an interface. One can add capabilities such as translation, adding buffering or smoothing data. One can remove capabilities e.g., to hide particular functions to untrusted users.
Modifiability
Change happens.

Four questions to consider when planning for modifiability:

What can change?
What is the likelihood of the change?
Where is the change made, and who makes it?
What is the cost of the change?
Important measures:

Cohesion	A module should do exactly what it is intended to do, and nothing else. This means splitting responsibilities up in different modules. E.g. if you have a "Person" module for some sort of system (e.g. banking), it does not make sense to put a lot of email responsibilities in there, e.g. for sending an email. That should rather be put in an email module. You'll want high cohesion
Coupling	How modules or components are tied together. You'll want loose coupling, which means that they aren't too tight. It's important because it'll make it harder to modify the system. E.g. if module A is dependent on B and C, which in turn is dependent on each other and on A.
General scenario
Source of stimulus	Who makes the change: End user, developer, sysadmin.
Stimulus	Someone wants the change..
Artifacts	Code, data, interfaces, components, resources, configurations ..
Environment	Runtime, compile time, build time, inititation time, design time.
Response	Make, test or deploy modification
Response measure	Cost in terms of time, effort, money, new defects, complexity
Tactics
Figure 7.3 from the book. 

Reduce the size of a module	
Split module	A big module will be expensive to modify. Split it up into smaller modules.
Increase cohesion	
Increase semantic coherence	A module should only have some responsibility A. If you discover it also has some responsibility B, move that to another module or create a new one for it.
Reduce coupling	
Encapsulate	Private and public methods. Have explicit interfaces for other modules to use, hide what's irrelevant to them.
Use an intermediary	But something in between dependencies. If A is dependent on B, but X in between to handle that communication. This leaves A and B more free from each other. The intermediary depends on the type of dependency.
Restrict dependencies	Some module A can only talk with a given set of modules X. In practice, this means you'll restrict modules visibility.
Refactor	Rewrite code so that you do not have duplicated code or responsibilities, and so that the code can be easily understood by developers.
Abstract common services	In the case two modules provide almost the same services, it will increase modifiability to let them implement some abstract service. (In Java, this means creating an abstract class.)
Defer binding

A parameterized function f(a,b)
 is more general than the similar function f(a)
 that assumes b=0
. When we bind the value of some parameters at a different phase in the life cycle than the one in which we defined the parameters, we are applying the defer binding tactic.

You'll want to bind as late as possible, so a change will only mean a change of argument, not the inner workings of a module.

Performance
It's about time.

Performance describes the software's ability to meet timing requirements.

General scenario
Source of stimulus	Internal or external to the system
Stimulus	Arrival of a periodic, sporadic or stochastic
Artifacts	System, or one or more components of the system
Environment	Operational: normal, emergency, peak or overload
Response	Process events, change level of service
Response measure	Latency, deadline, throughput, jitter, miss rate
Tactics
Figure 8.3 from the book

Control resource demand	Work to produce smaller demand
Managing sampling rate	Reduce the sampling rate environmental data is captured.
Limit event response	Queue up events, or processor utilization measure.
Prioritize events	Prioritize events depending on their importance.
Reduce overhead	Reduce intermediaries (important for modifiability). Modifiability/performance-tradeoff.
Bound execution times	Limit the amount of time that can be used to process an event.
Increase resource efficiency	Improve critical algorithms.
Manage resources	Work to make the resources at hand work more efficiently
Increase resources	Costs money.
Introduce concurrency	Process in parallel when possible
Maintain multiple copies of computations aka Caching	Introduces new responsibilities, like keeping data synchronized and choosing what data to be cached.
Bound queue sizes	Limit the events that can arrive, and you'll limit the resources spent on processing events. Need a policy for what happens with queue overflow. Often paired with limit event response tactic.
Schedule resources	If there's contention for a resource, the resource must be scheduled.
Security
Measures a system's ability to protect data from those who are not meant to have access, while still giving those who are authorized access.

Simple characteristic of security (for short: CIA):

1. Confidentiality	Data is protected from unauthorized access.
2. Integrity	Data is not subject to unauthorized manipulation.
3. Availability	System and data is available for legitimate use.
Other characteristics used to support CIA:

4. Authentication	Verifies identities
5. Nonrepudiation	Guarantees the sender of a message later can't deny sending it.
6. Authorization	Grants users privileges to perform a task (or tasks)
General scenario
Source of stimulus	Human or another system. May or may not have been already identified.
Stimulus	Unauthorized attempt to display, change or delete data, access system services, change system's behavior or reduce availability.
Artifacts	System services, data within the system, a component or resources of the system, data delivered to or from the system.
Environment	Online or offline. With or without a firewall. Fully, partially or not operational.
Response	Stop unauthorized use. Logging. Recovering from the attack.
Response measure	Time used to end the attack. A number of attacks detected. How long it takes to recover from an attack. How much data was vulnerable to an attack. Value of system/data compromised.
Tactics
One method of thinking about how to achieve security in a system is to think about physical security.

Figure 9.3 from the book

Detect attacks	If you detect the attacks, you can stop the attack. Very clever.
Detect intrusion	Compare network traffic and check for malicious patterns, e.g. TCP-flags, payload sizes, source or destination address, port, etc.
Detect service denial	Compare incoming traffic with know patterns of DDoS-attacks.
Verify message integrity	Use checksums or hash-values to see if messages are valid.
Detect message delay	Detect possible man-in-the-middle attacks. Check the time it takes to deliver messages, and check that this time stays about the same for the messages sent.
Resist attacks	Make it harder for attackers
Identify actors	Use input to identify attacker
Authenticate actors	Certificates, passwords etc.
Authorize actors	Authenticated users are allowed to modify and add data.
Limit access	Different degree of access
Limit exposure	Hide facts about the system. "Security by obscurity."
Encrypt data	So, yeah
Separate entities	Physical separation, virtualization, etc. Components are not at the same place and may be less affected by each other.
Change default settings	Don't have default settings.
React to attacks	Attack! How to respond
Revoke access	Limit access if you believe an attack is underway
Lock computer	Upon repeated failed login attempts, lock the system.
Inform actors	Inform people who may need to act.
Recover from attacks	Restore systems and data. Maintain an audit trail.
Testability
To what degree the system is testable. Used to demonstrate faults.

You'll want to plan for testing in the project plan, as it is very important for systems, especially big ones. You'll want a testing infrastructure that makes it easy to test, to introduce tests and mimic faults to see if the system can handle them. The infrastructure should also enable logging system states. You'll also want these to run automatically with development cycles/increments.

General scenario
Source of stimulus	Unit, integration, system, acceptance testers. Users. Manually running tests, or automatically.
Stimulus	The completion of a coding segment.
Artifacts	The part of the system being tested.
Environment	Design, development, compile, integration, deployment or run time
Response	Execute test suite and capture results, capture activity that resulted in the fault, controls and monitors the state of the system
Response measure	Effort to find the fault or class of faults, test coverage, reduction in risk exposure ...
Tactics
Figure 10.4 from the book

Control and observe system state	You cannot test something if you cannot observe what happens when you do.
Specialized testing interfaces	Capture variables. Can be done with special get and set methods, report-method, reset-method or a method to turn on verbose output.
Record/playback	Record state when it's crossing an interface
Localize state storage	Hard to test with distributed states
Abstract data sources	Make it easy to switch data sources through making the interfaces they go through abstract. E.g. with a banking system you would want a test database in development, but another in production. This means you want to be able to switch data sources easily.
Sandbox	Isolate a part of the system from the real world for experimentation. E.g. virtualization (with resources for instance.)
Executable assertions	Hard-code assertion and place assertion at specified places to check if values are okay.
Limit Complexity	Complex software is harder to test. It's hard to replicate a state when the state space is large (that is: The Software is complex.)
Limit structural complexity	Avoid or resolve cyclic dependencies, encapsulate and isolate environmental dependencies and reduce dependencies in general. High cohesion and loose coupling (see modifiability) can also help testability.
Limit nondeterminism	That is limit behavioral complexity. Deterministic systems are easier to test. Find all sources of nondeterminism such as unconstrained parallelism and weed them out as much as possible. All nondeterminism cannot be removed.
Usability
Usability is concerned with how easy it is for the user to accomplish the desired task and the kind of user support the system provides.

Over the last few years, this has become increasingly important, as users don't want to use (or buy) systems which are hard to use.

Comprises the following areas:

Learning system features
Using a system efficiently
Minimizing the impact of errors
Adapting the system to user needs
Increasing confidence and satisfaction
General scenario
Source of stimulus	End user, possibly in a specialized role.
Stimulus	End user does/attempts something in relation to the usability areas mentioned above.
Artifacts	The system or the part the user interacts with
Environment	Runtime or configuration time.
Response	Provide the user with the feature needed or anticipate the user's needs
Response measure	Task time, number of errors, number of tasks accomplished, user satisfaction, the gain of user knowledge, ratio of successful operations to total operations or amount of time or data loss when an error occurs.
Tactics
Figure 11.3 from the book 

Support user initiative	When the system is running, you enhance usability by giving the user feedback on what he or she is doing.
Cancel	Let the user cancel operations. This means the system must listen for the cancel command.
Undo	Let the user undo actions.
Pause/resume	Let the user pause and resume processes that take a lot of time.
Aggregate	Let the user group lower-level objects to a single group so they can do the same operation on the whole group.
Support system initiative	
Maintain task model	Task model is used to give the system context of what the user is trying to do, so it can help the user get there. E.g. knowing all sentences start with a capital letter and knowing the user is writing a text, the system can correct the text when the user forgets to use a capital letter.
Maintain user model	Represents user's knowledge of the system. Can control the amount of assistance the system gives. Can let the user customize the system.
Maintain system model	System model used to determine expected system behavior, e.g. so it can give the user an estimate of how much time an operation will take.
Other Quality Attributes
A few more arise frequently:

Variability	A special form of modifiability. It describes to which degree the system, documentation, supportf supports making variants of the system.
Portability	Special form of modifiability. In which degree the system can be made to run on a different platform than what was originally intended.
Development distributability	To what extent can the development of the software be distributed.
Scalability	How can the system handle more resources. Two types: Horizontal and vertical. Horizontal refers to adding more resources to logical units, e.g. add another server to a cluster of servers. Called elasticity in cloud environments. Vertical: Add more resources to a physical unit, e.g. more memory to a single server.
Deployability	How an executable arrives at a host, and how it is invoked. That means: How easy is it to deploy the system.
Mobility	Problems of movement, battery, reconnecting, etc.
Monitorability	The ability of the operations staff to monitor the system.
Safety	Does the system lead to unsafe actions, e.g. can a missile system fire random missiles.
Architectural Tactics and Patterns (Chapter 13)
An architectural pattern - is a package of design decisions that are found repeatedly in practice, - has known properties that permit reuse, and - describes a class of architectures.

Patterns are discovered, not invented.

An architectural pattern establishes a relationship between:

A context. A recurring, common situation in the world that gives rise to a problem.
A problem. The problem that arises in a given context. Often includes quality attributes that must be met.
A solution. A successful architectural solution to the problem. Determined and described by:
A set of element types (for example, data repositories, processes, and objects)
A set of interactions mechanisms or connectors (for example, method calls, events, or message bus)
A topological layout of the components
A set of semantic constraints covering topology, element behavior, and interaction mechanisms.
This {context, problem, solution} form constitutes a template for documenting a pattern.

Complex systems exhibit multiple patterns at once.

Architecture and Requirements (Chapter 16)
An architecturally significant requirement (ASR) is a requirement that will have a profound effect on architecture. ASRs can be extracted from a requirements document, captured from stakeholders in a workshop such as a quality attribute workshop (QAW), or derived from business goals.

Documenting Software Architectures (Chapter 18)
Views (18.3)
A view is a representation of a set of system elements and relations among them – not all system elements, but those of a particular type. For example, a layered view of a system would show elements of type "layer" – that is, it would show the system's decomposition into layers – and the relations among those layers.

The concept of views gives us our most fundamental principle of architecture documentation:
"Documenting an architecture is a matter of documenting the relevant views and then adding documentation that applies to more than one view."

What are the relevant views? That depends entirely on your goals.

Module Views
Module structures describe how the system is to be structured as a set of code or data units that have to be constructed or procured.

Example of fitting architectural pattern: Layered Pattern.

Component-and-Connector Views
Component-and-connector structures describe how the system is to be structured as a set of elements that have runtime behavior (components) and interactions (connectors).

The purpose of the C&C views is to show how the system works, guide development by specifying structure and behavior of runtime elements and help reason about runtime system quality attributes, such as performance and availability.

Examples of fitting architectural patterns: Broker, MVC, Pipe-and-Filter, Peer-to-Peer, Service-oriented architectural, Publish-Subscribe, Shared-Data pattern.

Allocation Views
Allocation views describe the mapping of software units to elements of an environment in which the software is developed or in which it executes. The environment might be the hardware, the operating environment in which the software is executed, the file systems supporting development or deployment, or the development organization(s). TL;DR: Allocation views describe the mapping from software elements to non-software elements (CPUs, file systems, networks, development teams, etc).

Example of fitting architectural patterns: Map-Reduce, Multi-tier pattern.

CBAM - Ikke pensum Vår 2019
CBAM elicits (extracts) cost and benefits associated with architectural decisions

CBAM stands for Cost Benefit Analysis Method. It uses a set of scenarios, whereas ATAM uses one and one scenario. CBAM varies the values of the Response Measure, to create full.

Would the stakeholders pay a bit more to have a faster system?
What is the level of availability can we get within the budget?
Do the stakeholders want to delay the project with 2 months to get the extra level of security?
The CBAM process consists of the following nine steps:

Collate scenarios (prioritize top 1/3)
Arrange all the scenarios gathered during the ATAM session
Stakeholders may add additional scenarios if needed
Prioritize based on their alignment with the business goal
Choose the top 1/3
Refine scenarios (worst, best, current and desired)
Refine the scenarios with an overview of the response measures
Worst => Minimum threshold the system must perform
Current => Elicit from the stakeholders
Desired => Elicit from the stakeholders
Best => Above the level stakeholders foresee no further utility (100% or 0%)
Prioritize scenarios (eliminate ½)
Allocate 100 votes to each stakeholder
Each stakeholder vote on scenarios based on the desired response value for each scenario
Eliminate half of the scenarios based on the weight of the given votes
Assign utility for current and desired levels
Develop architectural strategies for scenarios and determine quality attribute response levels
df
Determine the expected utility value of architectural strategy using interpolation
Calculate total benefit obtained from an architectural strategy
Choose architectural strategies based on ValueForCost subject to cost constraints
Confirm results with intuition
Architecture in the cloud (Chapter 26)
Cloud computing architecture refers to the components and subcomponents required for cloud computing. These components typically consist of a front end platform (fat client, thin client, mobile device), back end platforms (servers, storage), a cloud-based delivery, and a network (Internet, Intranet, Intercloud). Combined, these components make up cloud computing architecture.

Service models
Software as a Service (SaaS)	Consumer uses applications running in a cloud. Provides the equivalent of installed applications in the traditional (non-cloud computing) delivery of applications
Platform as a Service (PaaS)	Provides a platform allowing customers to develop, run, and manage applications without the complexity of building and maintaining the infrastructure typically associated with developing and launching an app
Infrastructure as a Service (IaaS)	Provides a virtual machine for the developer or system administrator. Services that abstract the user from the details of infrastructure like physical computing resources, location, data partitioning, scaling, security, backup, etc.
Quality Attributes
Security
Multi-tenancy introduce challenges. Put simply, a single instance of the software runs with several users simultaneously.
Security Risk of hosting applications in the cloud
Availability
Auto-scaling to fit performance to the growing load
Performance
Failure is a common occurrence in the cloud
The cloud itself must be available
Application developers must include detection and correction in case of failure
Architecture for the edge (Chapter 27)
Syllabus articles
This should be updated every year. This is from 2015:

"Game Architecture and Design - A New Edition", Andrew Rollings and Dave Morris. Only the following pages from chapter 17 are in the syllabus: page 462 (from Hardware Abstraction) to page 500 (before State Transitions and Properties).
IEEE (2000), "IEEE Recommended Practice for Architectural Description of Software-Intensive Systems", Software Engineering Standards Committee of the IEEE Computer Society.
Kruchten, P. (1995), "The 4+1 View Model of Architecture, IEEE Software", 12, 6, Pp. 42 - 50. Link
Coplien J. O. (1998): "Software Design Patterns: Common Questions and Answers", The Patterns Handbook: Techniques, Strategies, and Applications, Cambridge University Press, New York, pp. 311-320.
The second and third one could be brought to the exam.

"Game Architecture and Design - A New Edition", Rollings and Morris
Glossary
FPS	Frame per second. Limited by the rate of AI ticks.
Token	Element of the game that is directly or indirectly manipulated by the player, and supervised and managed by the computer.
Steps of creating a game architecture
Find tokens
Analyze interactions and events
Create a logical view using tokens
IEEE (2000): "IEEE Recommended Practice for Architectural Description of Software-Intensive Systems"
Meant to give some guidelines to those who develop, design, oversee, evaluate, describe, etc. computer systems.

Introduces a conceptual framework, or frame of references, for architectural description. Describes how you select views based on stakeholders and requirements. Description of the different stakeholders and their roles.

It goes on to explain some terms. These explanations have been placed in the introduction to this Wikipendium-article.

Goes on to describe practices in the architectural documentation (AD). Each of these points is explained in detail.

AD Identification, version and overview information
Identification of system stakeholders and their concerns judged to be relevant to the architecture
Specification of each viewpoint that has been selected to organize representation of the architecture and the rationale for those selections
One or more architectural views
A record of all known inconsistencies among the AD's required constituents
A rationale for selection of the architecture
Krutchen (1995): "The 4+1 View Model of Architecture, IEEE Software"
Describes the 4+1 view model of AD views.

4+1 view model

Overview of the views:

Name	For	Description
Logical view	End-user, functionality	"Supports the functionality requirements. The system is decomposed into a set of key abstractions, taken (mostly) from the problem domain in the form of objects and object classes."
Process view	Integrators, performance, scalability	Addresses some non-functional requirements. Looks on how different processes will work on different tasks, and how they will communicate with each other.
Development view	Programmers, software management	"Focuses on the actual software module organization on the software development environment." It shows how the complete system can be divided into small chunks, like modules and library. This is used by developers/software managers to give tasks to different team members.
Physical view	System engineers, topology, communications	"Mapping software to hardware." Focuses on non-function requirements and how the physical hardware will fulfill these.
Scenarios	-	Shows how all the views work together, through instances of more general use cases called scenarios.
The article includes the notation, notion, and examples of each view.

The article goes on to point out how all the views are in some way connected and are not independent of each other. They describe how this is. It also describes how you can tailor this model for your project.

Coplien (1998): "Software Design Patterns: Common Questions and Answers"
Starts by explaining what a pattern is (see the introduction of this article), and where software patterns come from. This is also the subject of the article. It introduces a few terms, which are explained below. A great read if you're unsure of what patterns are.

Some terms the text explains:

Non-generative pattern aka Gamma patterns	Observed in already built systems. Descriptive and passive.
Generative pattern	Patterns that generate code or systems. Prescriptive, active.
Alexandrian form	Most patterns are expressed in this form. It includes: The name of the pattern, the problem the pattern is trying to solve, the context it is to be used in (e.g. a specific language), forces/tradeoffs, the actual solution, examples of use, unresolved results/resulting context and a design rational which tells where the pattern came from, why it works and why it is used.
Pattern language	"Structured collection of patterns that build on each other to transform needs and constraints into architecture."
Idioms	Special kind of pattern tied to a specific language. You don’t want your patterns to depend on a language (cast idioms to patterns
The last two pages describe the pattern "Type Promotion" of C++ on the Alexandrian form, cast from an idiom.
