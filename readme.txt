# IFluentInterface

The core interface to implement fluent APIs that hide the default System.Object members 
has been added to your project. 

No additional files are added to your source, but the new IFluentInterface is ready to be 
"implemented" in all your classes or interfaces where you want to hide the base System.Object 
members, like:

// C#
public interface IVerifies : IFluentInterface

// VB
Public Interface IVerifies 
	Inherits IFluentInterface


You don't need to implement any actual interface members. The mere fact of declaring this 
inheritance causes Visual Studio to hide the System.Object whenever it's consumed as a 
library from another project (although you won't see the effect within the same solution).