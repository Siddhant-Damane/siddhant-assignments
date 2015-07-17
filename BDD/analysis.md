Behavior-Driven Development (BDD)


Behavior Driven Development (BDD) is a logical continuation of the Test-Driven Development, TDD methodology.

In BDD the software development process is arranged as in TDD but the scenario is written instead of unit tests. The scenario is actually a user story as it is treated in Agile methodologies. The scenario is written almost in a plain human language with some conventions that consequently allows this scenario to be interpreted into a test, which is applied to an application code.


Advantages of scenarios are as follows:

1.The developer is focused on how a program works, its functionality and behavior, rather than on what the program produces.

2.Writing a scenario is in fact writing a user story that makes it easy to convert a user story in a scenario and vice versa.

3.Due to simplicity of the language used to write the scenario, it can be easily read by any team member.  Even a non-techie person will see what’s wrong in case the scenario fails. Either it is because of incorrect requirements or incorrect implementation in the code.

4.The focus is not on tests, but on the behavioral specifications.


The BDD methodology is more popular in the projects which are developed using dynamic (scripting) languages.



BDD practices

The practices of BDD include:

1.Establishing the goals of different stakeholders required for a vision to be implemented

2.Drawing out features which will achieve those goals using feature injection

3.Involving stakeholders in the implementation process through outside–in software development

4.Using examples to describe the behavior of the application, or of units of code

5.Automating those examples to provide quick feedback and regression testing

6.Using ‘should’ when describing the behavior of software to help clarify responsibility and allow the software’s functionality to be questioned

7.Using ‘ensure’ when describing responsibilities of software to differentiate outcomes in the scope of the code in question from side-effects of other elements of code.

8.Using mocks to stand-in for collaborating modules of code which have not yet been written




Jasmine :




A JavaScript Testing Framework

Jasmine is a Behavior Driven Development testing framework for JavaScript. It does not rely on browsers, DOM, or any JavaScript framework. Thus it's suited for websites, Node.js projects, or anywhere that JavaScript can run.

Supported environments

Jasmine tests itself across many browsers (Safari, Chrome, Firefox, PhantomJS, and new Internet Explorer) as well as node. 




Files which I have uploaded contains spec file , src file , html file and jasmine library folder.

src file contains functions which has to be tested.from which one of the function prints some string and calls another function for city name.
test case is written for, to check if function has been called or not and with which argument that function was called.

next function returns a string , and test case is written to check if returned string is equal to the given string or not.

also one more test case is written to check if function is NOT CALLED with given string.

