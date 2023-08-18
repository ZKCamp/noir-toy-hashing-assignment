global PRIME: u32 = 16777619;
global INITIAL_STATE: u64 = 2166136261;
global SIZE: u64 = 4294967296;

fn main(value: u32, hash_value: pub u32){
    let calculated_hash_value = calculate_hash(value);

    assert(calculated_hash_value == hash_value);
}

fn u32_to_u8(num:u32) -> [u8;4] {
    let mut out: [u8; 4] = [0; 4];
    for i in 0..4 {
        out[i] = (num >> (24 - (i * 8))) as u8;
    }
    out
}
fn calculate_hash(num: u32) -> u32 {
    let mut hash = INITIAL_STATE;
    let transformedu8 = u32_to_u8(num);
    for i in 0 ..transformedu8.len() {
        let product = (((hash * PRIME as u64)) % SIZE);
        hash = product ^ (transformedu8[i] as u64);
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
