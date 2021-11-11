pragma abicoder v2;
contract C {
	function f(uint256 p) public {}

	function f0() public pure returns (bytes memory) {
		return abi.encodeWithSignature("f(uint256)", 1);
	}
	function f0Checked() public view returns (bytes memory) {
		return abi.encodeChecked(f, (1));
	}
	function f1() public pure returns (bytes memory) {
		string memory x = "f(uint256)";
		return abi.encodeWithSignature(x, 1);
	}
	function f1Checked() public view returns (bytes memory) {
		return abi.encodeChecked(f, (1));
	}
	string xstor;
	function f1s() public returns (bytes memory) {
		xstor = "f(uint256)";
		return abi.encodeWithSignature(xstor, 1);
	}
}
// ====
// compileViaYul: also
// ----
// f0() -> 0x20, 0x24, -34435155370463444793260793355178157075203752403645521721995013737368954863616, 26959946667150639794667015087019630673637144422540572481103610249216
// f0Checked() -> 0x20, 0x24, -34435155370463444793260793355178157075203752403645521721995013737368954863616, 26959946667150639794667015087019630673637144422540572481103610249216
// f1() -> 0x20, 0x24, -34435155370463444793260793355178157075203752403645521721995013737368954863616, 26959946667150639794667015087019630673637144422540572481103610249216
// f1Checked() -> 0x20, 0x24, -34435155370463444793260793355178157075203752403645521721995013737368954863616, 26959946667150639794667015087019630673637144422540572481103610249216
// f1s() -> 0x20, 0x24, -34435155370463444793260793355178157075203752403645521721995013737368954863616, 26959946667150639794667015087019630673637144422540572481103610249216