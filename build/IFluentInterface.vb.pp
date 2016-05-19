Imports System.ComponentModel

Namespace Global.$rootnamespace$

    ''' <summary>
    ''' Interface that Is used to build fluent interfaces by hiding methods declared by <see cref="Object"/> from IntelliSense.
    ''' </summary>
    ''' <remarks>
    ''' Code that consumes implementations of this interface should expect one of two things:
    ''' <list type = "number">
    '''   <item>When referencing the interface from within the same solution (project reference), you will still see the methods this interface Is meant to hide.</item>
    '''   <item>When referencing the interface through the compiled output assembly (external reference), the standard Object methods will be hidden as intended.</item>
    '''   <item>When using Resharper, be sure to configure it to respect the attribute: Options, go to Environment | IntelliSense | Completion Appearance And check "Filter members by EditorBrowsable attribute".</item>
    ''' </list>
    ''' See https://kzu.github.io/IFluentInterface for more information.
    ''' </remarks>
    '''	<nuget id="IFluentInterface" />
    <EditorBrowsable(EditorBrowsableState.Never)>
    Public Interface IFluentInterface
        ''' <summary>
        ''' Redeclaration that hides the <see cref="Object.GetType()"/> method from IntelliSense.
        ''' </summary>
        <EditorBrowsable(EditorBrowsableState.Never)>
        Function [GetType]() As Type

        ''' <summary>
        ''' Redeclaration that hides the <see cref="Object.GetHashCode()"/> method from IntelliSense.
        ''' </summary>
        <EditorBrowsable(EditorBrowsableState.Never)>
        Function GetHashCode() As Int32

        ''' <summary>
        ''' Redeclaration that hides the <see cref="Object.ToString()"/> method from IntelliSense.
        ''' </summary>
        <EditorBrowsable(EditorBrowsableState.Never)>
        Function ToString() As String

        ''' <summary>
        ''' Redeclaration that hides the <see cref="Object.Equals(object)"/> method from IntelliSense.
        ''' </summary>
        <EditorBrowsable(EditorBrowsableState.Never)>
        Function Equals(ByVal obj As Object) As Boolean
    End Interface

End Namespace
