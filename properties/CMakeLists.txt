#
# Copyright (c) 2011-2012 EditorConfig Team
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#

# Any time you want to test for two different output lines, test them
# separately.  That way they can occur in either order in the output.
# See editorconfig/editorconfig#375.

# test tab_width default
new_ec_test(tab_width_default_a tab_width_default.in test.c
    "(^|[\n\r]+)indent_style=space[ \t\n\r]+")

new_ec_test(tab_width_default_b tab_width_default.in test.c
    "(^|[\n\r]+)indent_size=4[ \t\n\r]+")

new_ec_test(tab_width_default_c tab_width_default.in test.c
    "(^|[\n\r]+)tab_width=4[ \t\n\r]+")

# Tab_width should not be set to any value if indent_size is "tab" and
# tab_width is not set
new_ec_test(tab_width_default_indent_size_tab_a tab_width_default.in test2.c
    "(^|[\n\r]+)indent_style=tab[ \t\n\r]+")

new_ec_test(tab_width_default_indent_size_tab_b tab_width_default.in test2.c
    "(^|[\n\r]+)indent_size=tab[ \t\n\r]+")

# Test indent_size default. When indent_style is "tab", indent_size defaults to
# "tab".
new_ec_test(indent_size_default_a indent_size_default.in test.c
    "(^|[\n\r]+)indent_style=tab[ \t\n\r]+")

new_ec_test(indent_size_default_b indent_size_default.in test.c
    "(^|[\n\r]+)indent_size=tab[ \t\n\r]+")

# Test indent_size default. When indent_style is "tab", indent_size should have
# no default value for version prior than 0.9.0.
new_ec_test_version(indent_size_default_pre_0_9_0 indent_size_default.in test.c
    "^indent_style=tab[ \t\n\r]*$" 0.8.0)

# Test indent_size default. When indent_style is "space", indent_size has no
# default value.
new_ec_test(indent_size_default_space indent_size_default.in test2.c
    "^indent_style=space[ \t\n\r]*$")

# Test indent_size default. When indent_style is "tab" and tab_width is set,
# indent_size should default to tab_width
new_ec_test(indent_size_default_with_tab_width_a indent_size_default.in test3.c
    "(^|[\n\r]+)indent_style=tab[ \t\n\r]+")

new_ec_test(indent_size_default_with_tab_width_b indent_size_default.in test3.c
    "(^|[\n\r]+)tab_width=2[ \t\n\r]+")

new_ec_test(indent_size_default_with_tab_width_c indent_size_default.in test3.c
    "(^|[\n\r]+)indent_size=2[ \t\n\r]+")

# test that same property values are lowercased (v0.9.0 properties).
new_ec_test(lowercase_values1_a lowercase_values.in test1.c
    "(^|[\n\r]+)indent_style=space[ \t\n\r]+")

new_ec_test(lowercase_values1_b lowercase_values.in test1.c
    "(^|[\n\r]+)end_of_line=crlf[ \t\n\r]+")

# test that same property values are lowercased (v0.9.0 properties)
new_ec_test(lowercase_values2_a lowercase_values.in test2.c
    "(^|[\n\r]+)insert_final_newline=true[ \t\n\r]+")

new_ec_test(lowercase_values2_b lowercase_values.in test2.c
    "(^|[\n\r]+)trim_trailing_whitespace=false[ \t\n\r]+")

new_ec_test(lowercase_values2_c lowercase_values.in test2.c
    "(^|[\n\r]+)charset=utf-8[ \t\n\r]+")

# test that same property values are not lowercased
new_ec_test(lowercase_values3 lowercase_values.in test3.c
    "^test_property=TestValue[ \t\n\r]*$")

# test that all property names are lowercased
new_ec_test(lowercase_names lowercase_names.in test.c
    "^testproperty=testvalue[ \t\n\r]*$")

# Test that values are pulled correctly from multiple sections across
# multiple editorconfig files
new_ec_test(multi_section_a multi_section.in "test.file"
    "(^|[\n\r]+)from_test=yes[ \t\n\r]+")

new_ec_test(multi_section_b multi_section.in "test.file"
    "(^|[\n\r]+)from_file=yes[ \t\n\r]+")

new_ec_test(multi_section_c multi_section.in "test.file"
    "(^|[\n\r]+)from_test_parent=yes[ \t\n\r]+")

new_ec_test(multi_section_d multi_section.in "test.file"
    "(^|[\n\r]+)from_file_parent=yes[ \t\n\r]+")

# ... and that properties in editorconfig files closer to the target file
# win over properties in editorconfig files closer to the root.
new_ec_test(multi_section_e multi_section.in "test.file"
    "(^|[\n\r]+)child_wins=yes[ \t\n\r]+")

new_ec_test_does_not_match(multi_section_f multi_section.in "test.file"
    "(^|[\n\r]+)child_wins=no[ \t\n\r]+")
