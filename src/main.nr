use dep::std;

global PRIME: u32 = 16777619;

fn main(value: u32, hash_value: pub u32){
    let calculated_hash_value = calculate_hash(value);

    assert(calculated_hash_value == hash_value);
}

fn calculate_hash(num: u32) -> u32 {
    let mut hash_value: u64 = 2166136261;
    let num_bytes: [u8] = (num as Field).to_be_bytes(4);

    for i in 0..4 {
        let product: u64 = (hash_value * PRIME as u64) % (1 << 32);
        hash_value = (product ^ num_bytes[i] as u64) ;
    }

    hash_value as u32
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
