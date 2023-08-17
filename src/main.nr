use dep::std;

global PRIME: u32 = 16777619;

fn main(value: u32, hash_value: pub u32){
    let calculated_hash_value = calculate_hash(value);

    assert(calculated_hash_value == hash_value);
}

fn calculate_hash(num: u32) -> u32 {
    let size: u64 = 4294967296;
    let mut hash: u64 = 2166136261;
    let bytes: [u8] = (num as Field).to_be_bytes(4);

    for byte in bytes {
        let product = (hash * PRIME as u64) % size;
        hash = product ^ byte as u64;
    }
    hash as u32
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
