import 'dart:ffi';

import 'package:win32/win32.dart';

/// @nodoc
typedef IUnknown_AddRef_Native = Uint32 Function(VTablePointer lpVtbl);

/// @nodoc
typedef IUnknown_Release_Native = IUnknown_AddRef_Native;

/// @nodoc
typedef IUnknown_QueryInterface_Native = HRESULT Function(
    VTablePointer lpVtbl, Pointer<GUID> riid, Pointer<VTablePointer> ppvObject);

/// @nodoc
final class IUnknownVtbl extends Struct {
  external Pointer<NativeFunction<IUnknown_QueryInterface_Native>>
      QueryInterface;
  external Pointer<NativeFunction<IUnknown_AddRef_Native>> AddRef;
  external Pointer<NativeFunction<IUnknown_Release_Native>> Release;
}

/// @nodoc
typedef IInspectable_GetIids_Native = HRESULT Function(VTablePointer lpVtbl,
    Pointer<Uint32> iidCount, Pointer<Pointer<GUID>> iids);

/// @nodoc
typedef IInspectable_GetRuntimeClassName_Native = HRESULT Function(
    VTablePointer lpVtbl, Pointer<IntPtr> className);

/// @nodoc
typedef IInspectable_GetTrustLevel_Native = HRESULT Function(
    VTablePointer lpVtbl, Pointer<Int32> trustLevel);

/// @nodoc
final class IInspectableVtbl extends Struct {
  external IUnknownVtbl baseVtbl;
  external Pointer<NativeFunction<IInspectable_GetIids_Native>> GetIids;
  external Pointer<NativeFunction<IInspectable_GetRuntimeClassName_Native>>
      GetRuntimeClassName;
  external Pointer<NativeFunction<IInspectable_GetTrustLevel_Native>>
      GetTrustLevel;
}
