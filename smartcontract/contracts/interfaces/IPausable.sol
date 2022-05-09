pragma solidity ^0.8.0;

interface IPausable {
    event Paused(address indexed account);
    event UnPaused(address indexed account);

    function paused() external view returns (bool);
    function pause() external;
    function unPause() external;
}