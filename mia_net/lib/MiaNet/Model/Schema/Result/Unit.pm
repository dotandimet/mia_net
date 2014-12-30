use utf8;
package MiaNet::Model::Schema::Result::Unit;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::Unit

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<units>

=cut

__PACKAGE__->table("units");

=head1 ACCESSORS

=head2 name

  data_type: 'varchar2'
  is_nullable: 0
  size: 10

=head2 type

  data_type: 'varchar2'
  is_nullable: 0
  size: 10

=cut

__PACKAGE__->add_columns(
  "name",
  { data_type => "varchar2", is_nullable => 0, size => 10 },
  "type",
  { data_type => "varchar2", is_nullable => 0, size => 10 },
);

=head1 PRIMARY KEY

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->set_primary_key("name");

=head1 RELATIONS

=head2 ingredients

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::Ingredient>

=cut

__PACKAGE__->has_many(
  "ingredients",
  "MiaNet::Model::Schema::Result::Ingredient",
  { "foreign.units" => "self.name" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 protocols

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::Protocol>

=cut

__PACKAGE__->has_many(
  "protocols",
  "MiaNet::Model::Schema::Result::Protocol",
  { "foreign.base_units" => "self.name" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-12-30 12:45:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UsoWcVxkC3S42WbInRb5Kw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
