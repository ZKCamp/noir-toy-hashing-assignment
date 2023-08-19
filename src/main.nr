use dep::std;

global PRIME: u32 = 16777619;
global HASH_BASIS: u32 = 2166136261;

fn u32_to_u8(num: u32) -> [u8; 4] {
    let mut out: [u8; 4] = [0; 4];

    out[3] = num as u8;
    out[2] = (num >> 8 ) as u8;
    out[1] = (num >> 16) as u8;
    out[0] = (num >> 24) as u8;

    out
}

fn u8_to_u32(arr: [u8; 4]) -> u32 {
    let out: u32 = (arr[3] as u32) 
                + ((arr[2] as u32) << 8) 
                + ((arr[1] as u32) << 16) 
                + ((arr[0] as u32) << 24);
    out
}

fn fnv_hash_u8(arr: [u8; 4]) -> u32 {
    let mut out: u32 = HASH_BASIS;

    out = (out * PRIME) ^ (arr[0] as u32);
    out = (out * PRIME) ^ (arr[1] as u32);
    out = (out * PRIME) ^ (arr[2] as u32);
    out = (out * PRIME) ^ (arr[3] as u32);

    out
}

#[test]
fn test_convert_1() {
    let mut num = [1, 2, 3, 4];
    assert(num == u32_to_u8(u8_to_u32(num)));

    num = [8, 8, 8, 8];
    assert(num == u32_to_u8(u8_to_u32(num)));
}

fn calculate_hash(num: u32) -> u32 {
    fnv_hash_u8(u32_to_u8(num))
}

fn main(value: u32, hash_value: pub u32){
    let calculated_hash_value = calculate_hash(value);

    assert(calculated_hash_value == hash_value);
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
