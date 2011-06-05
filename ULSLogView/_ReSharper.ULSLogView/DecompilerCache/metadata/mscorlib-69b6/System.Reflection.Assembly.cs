// Type: System.Reflection.Assembly
// Assembly: mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089
// Assembly location: C:\Windows\Microsoft.NET\Framework\v2.0.50727\mscorlib.dll

using System;
using System.Configuration.Assemblies;
using System.Globalization;
using System.IO;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Serialization;
using System.Security;
using System.Security.Policy;

namespace System.Reflection
{
    [ClassInterface(ClassInterfaceType.None)]
    [ComVisible(true)]
    [ComDefaultInterface(typeof (_Assembly))]
    [Serializable]
    public class Assembly : _Assembly, IEvidenceFactory, ICustomAttributeProvider, ISerializable
    {
        [ComVisible(false)]
        public Module ManifestModule { get; }

        [ComVisible(false)]
        public virtual bool ReflectionOnly { get; }

        [ComVisible(false)]
        public virtual string ImageRuntimeVersion { get; }

        [ComVisible(false)]
        public long HostContext { get; }

        #region _Assembly Members

        public override bool Equals(object o);
        public override int GetHashCode();
        public virtual AssemblyName GetName();
        public virtual AssemblyName GetName(bool copiedName);

        Type _Assembly.GetType();
        public virtual Type GetType(string name);
        public virtual Type GetType(string name, bool throwOnError);
        public Type GetType(string name, bool throwOnError, bool ignoreCase);
        public virtual Type[] GetExportedTypes();

        [MethodImpl(MethodImplOptions.NoInlining)]
        public virtual Type[] GetTypes();

        [MethodImpl(MethodImplOptions.NoInlining)]
        public virtual Stream GetManifestResourceStream(Type type, string name);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public virtual Stream GetManifestResourceStream(string name);

        public Assembly GetSatelliteAssembly(CultureInfo culture);
        public Assembly GetSatelliteAssembly(CultureInfo culture, Version version);
        public virtual void GetObjectData(SerializationInfo info, StreamingContext context);
        public virtual object[] GetCustomAttributes(bool inherit);
        public virtual object[] GetCustomAttributes(Type attributeType, bool inherit);
        public virtual bool IsDefined(Type attributeType, bool inherit);

        public Module LoadModule(string moduleName, byte[] rawModule);
        public Module LoadModule(string moduleName, byte[] rawModule, byte[] rawSymbolStore);
        public object CreateInstance(string typeName);
        public object CreateInstance(string typeName, bool ignoreCase);

        public object CreateInstance(string typeName, bool ignoreCase, BindingFlags bindingAttr, Binder binder,
                                     object[] args, CultureInfo culture, object[] activationAttributes);

        public Module[] GetLoadedModules();
        public Module[] GetLoadedModules(bool getResourceModules);
        public Module[] GetModules();
        public Module[] GetModules(bool getResourceModules);
        public Module GetModule(string name);
        public virtual FileStream GetFile(string name);
        public virtual FileStream[] GetFiles();
        public virtual FileStream[] GetFiles(bool getResourceModules);
        public virtual string[] GetManifestResourceNames();

        public AssemblyName[] GetReferencedAssemblies();

        [MethodImpl(MethodImplOptions.NoInlining)]
        public virtual ManifestResourceInfo GetManifestResourceInfo(string resourceName);

        public override string ToString();
        public virtual string CodeBase { get; }
        public virtual string EscapedCodeBase { get; }
        public virtual string FullName { get; }
        public virtual MethodInfo EntryPoint { get; }
        public virtual Evidence Evidence { get; }

        public virtual string Location { get; }

        public bool GlobalAssemblyCache { get; }

        public event ModuleResolveEventHandler ModuleResolve;

        #endregion

        [MethodImpl(MethodImplOptions.InternalCall)]
        public static string CreateQualifiedName(string assemblyName, string typeName);

        public static Assembly GetAssembly(Type type);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly LoadFrom(string assemblyFile);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly ReflectionOnlyLoadFrom(string assemblyFile);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly LoadFrom(string assemblyFile, Evidence securityEvidence);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly LoadFrom(string assemblyFile, Evidence securityEvidence, byte[] hashValue,
                                        AssemblyHashAlgorithm hashAlgorithm);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly Load(string assemblyString);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly ReflectionOnlyLoad(string assemblyString);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly Load(string assemblyString, Evidence assemblySecurity);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly Load(AssemblyName assemblyRef);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly Load(AssemblyName assemblyRef, Evidence assemblySecurity);

        [Obsolete(
            "This method has been deprecated. Please use Assembly.Load() instead. http://go.microsoft.com/fwlink/?linkid=14202"
            )]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly LoadWithPartialName(string partialName);

        [Obsolete(
            "This method has been deprecated. Please use Assembly.Load() instead. http://go.microsoft.com/fwlink/?linkid=14202"
            )]
        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly LoadWithPartialName(string partialName, Evidence securityEvidence);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly Load(byte[] rawAssembly);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly ReflectionOnlyLoad(byte[] rawAssembly);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly Load(byte[] rawAssembly, byte[] rawSymbolStore);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly Load(byte[] rawAssembly, byte[] rawSymbolStore, Evidence securityEvidence);

        public static Assembly LoadFile(string path);
        public static Assembly LoadFile(string path, Evidence securityEvidence);

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly GetExecutingAssembly();

        [MethodImpl(MethodImplOptions.NoInlining)]
        public static Assembly GetCallingAssembly();

        public static Assembly GetEntryAssembly();
    }
}
