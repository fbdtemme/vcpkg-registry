vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO fbdtemme/bencode
  REF d30b335336c02f43100930b73e1da3fb8a388927
  SHA512 573c05ca6c2869e02503a651d62e3734787d8f969d7116e2b57685219ed492a1068f7e36f1b1cd243a6c85a8b736b58407217b1a74258e6ab265199d1528f184
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    -DBENCODE_BUILD_TESTS=OFF
    -DBENCODE_BUILD_BENCHMARKS=OFF
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(
  PACKAGE_NAME bencode
  CONFIG_PATH lib/cmake/bencode
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)