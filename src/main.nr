global PRIME: u32 = 16777619;

fn main(value: u32, hash_value: pub u32){
    let calculated_hash_value = calculate_hash(value);

    assert(calculated_hash_value == hash_value);
}

fn calculate_hash(num: u32) -> u32 {
    let mut hash_value: u32 = 0x811C9DC5;

    let num_field = num as Field;
    let data = num_field.to_be_bytes(4); // Here 4 represents desired size of the resulting byte array
    
    for i in 0..4 {
        let product = hash_value * PRIME; 
        hash_value = product ^ (data[i] as u32);
    }

    hash_value
}

#[test]
fn test_1() {
    let num = 127561628;
    let hash = calculate_hash(num);
    
    assert(hash == 0x71233de7);
}

#[test]
fn test_2() {
    let num = 237261828;
    let hash = calculate_hash(num);

    assert(hash == 0x7F51D567);
}

#[test]
fn test_3() {
    let num = 596214892;
    let hash = calculate_hash(num);

    assert(hash == 0x3F0C8995);
}
