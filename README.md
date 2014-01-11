![Icon](https://raw.github.com/clariuslabs/IFluentInterface/master/images/icon-32.png) IFluentInterface
================

In modern fluent APIs, [method chaining](http://en.wikipedia.org/wiki/Method_chaining) is a key techique for intuitive discovery of valid options when configuring some underlying object. 

In these scenarios, [System.Object](http://msdn.microsoft.com/en-us/library/system.object.aspx) methods (Equals, GetHashCode, GetType and ToString) only contribute clutter to Visual Studio intellisense. Everyone knows those members are always there, yet they are seldom used explicitly. This is quite annoying for fluent APIs that define the flow of invocations in terms of interfaces and usually have few members at each "step" of the method chaining statement.

For example, in the following [Moq](https://github.com/Moq) setup, at the particular step in the statement, there is only one "real" invocation that makes sense (Verifiable). However, it is obscured by the System.Object members:

![Full Intellisense](https://raw.github.com/clariuslabs/IFluentInterface/master/images/full-intellisense.png)

A much cleaner intellisense is possible though, by simply inherinting your fluent API interfaces from the [`IFluentInterface`](https://github.com/clariuslabs/IFluentInterface/blob/master/content/IFluentInterface.cs.pp) interface provided by this project:

![Clean Intellisense](https://raw.github.com/clariuslabs/IFluentInterface/master/images/clean-intellisense.png)


# How to Install
IFluentInterface is a single interface definition file with no external dependencies whatsoever and is distributed as a [NuGet](https://nuget.org/packages/ifluentinterface) package. It can be installed issuing the following command in the [Package Manager Console](http://docs.nuget.org/docs/start-here/using-the-package-manager-console):

    PM> Install-Package IFluentInterface

After installation, the [`IFluentInterface`](https://github.com/clariuslabs/IFluentInterface/blob/master/content/IFluentInterface.cs.pp) file will be added to your project root, and its target namespace will match the current project's. There are no associated binaries at all.


# How it Works
The trick comes from the [EditorBrowsableAttribute](http://msdn2.microsoft.com/en-us/library/System.ComponentModel.EditorBrowsableAttribute.aspx), which controls visibility of members in VS intellisense. To hide a member from intellisense, you apply the following attribute to it:

```
[EditorBrowsable(EditorBrowsableState.Never)]
```

Now, you don’t want to have to override all four object members in every type just to apply the attribute. A quite elegant solution exists, which involves taking advantage of implicit interface implementation. In particular, you can define an interface that re-defines all object members and applies the attribute:

```
[EditorBrowsable(EditorBrowsableState.Never)]
public interface IFluentInterface
{
    [EditorBrowsable(EditorBrowsableState.Never)]
    Type GetType();
 
    [EditorBrowsable(EditorBrowsableState.Never)]
    int GetHashCode();
 
    [EditorBrowsable(EditorBrowsableState.Never)]
    string ToString();
 
    [EditorBrowsable(EditorBrowsableState.Never)]
    bool Equals(object obj);
}
```

Now you simply "implement" this interface in all your classes or interfaces where you want to hide these members, like:

```
public interface IVerifies : IFluentInterface
```


# Who's Using This?
Pretty much every project that has a fluent API. Over time, I’ve started liking the `IFluentInterface` name better than my original `IHideObjectMembers`, but you can also find this interface defined as `IFluentSyntax` too.

As of 7/2013, I've found [50+ repositories using IFluentInterface](https://github.com/search?q=%22interface+IFluentInterface%22&type=Code&ref=searchresults), [70+ using IHideObjectMembers](https://github.com/search?q=%22interface+IHideObjectMembers%22&type=Code&ref=searchresults) and [16 using IFluentSyntax](https://github.com/search?q=%22interface+IFluentSyntax%22&type=Code&ref=searchresults), on GitHub only! And 40+ using one form or another via the [Ohloh source indexing service](http://code.ohloh.net/search?s=idef%3AIFluentInterface&browser=Default&filterChecked=true). 


# Credits
If you do leverage this technique, please maintain the original file credits as shown in [the source file](https://github.com/clariuslabs/IFluentInterface/blob/master/content/IFluentInterface.cs.pp). Our preference is for you to just install the [IFluentInterface](http://nuget.org/packages/ifluentinterface) nuget to get the interface and keep it up to date.
