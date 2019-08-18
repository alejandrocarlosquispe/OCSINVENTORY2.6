package Api::Ocsinventory::Restapi::Computer::Get::ComputerIdField;

=for comment

This function return a computer field from his ID and field

=cut

# Common sub for api
use Api::Ocsinventory::Restapi::ApiCommon;
use Mojo::JSON qw(decode_json encode_json);

sub get_computer_field {

    my ($id, $field) = @_;

    my $computers = Api::Ocsinventory::Restapi::ApiCommon::get_item_table_informations("hardware", "id", $id);
    my $json_return;

    foreach my $computer ( @$computers ) {
        $$json_return{"$computer->{ID}"}{"hardware"} = $computer;
        $json_return = Api::Ocsinventory::Restapi::ApiCommon::generate_item_datamap_json("computer", $computer->{ID}, $json_return, $field);
    }

    return encode_json($json_return);
}

1;
