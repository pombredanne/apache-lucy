package Lucy::Store::LockErr;
use Lucy;

1;

__END__

__BINDING__

my $synopsis = <<'END_SYNOPSIS';
    while (1) {
        my $bg_merger = eval {
            Lucy::Index::BackgroundMerger->new( index => $index );
        };
        if ( blessed($@) and $@->isa("Lucy::Store::LockErr") ) {
            warn "Retrying...\n";
        }
        elsif (!$bg_merger) {
            # Re-throw.
            die "Failed to open BackgroundMerger: $@";
        }
        ...
    }
END_SYNOPSIS

Clownfish::Binding::Perl::Class->register(
    parcel     => "Lucy",
    class_name => "Lucy::Store::LockErr",
    make_pod   => { synopsis => $synopsis }
);

__COPYRIGHT__

    /**
     * Copyright 2010 The Apache Software Foundation
     *
     * Licensed under the Apache License, Version 2.0 (the "License");
     * you may not use this file except in compliance with the License.
     * You may obtain a copy of the License at
     *
     *     http://www.apache.org/licenses/LICENSE-2.0
     *
     * Unless required by applicable law or agreed to in writing, software
     * distributed under the License is distributed on an "AS IS" BASIS,
     * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
     * implied.  See the License for the specific language governing
     * permissions and limitations under the License.
     */

