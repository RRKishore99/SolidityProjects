//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract EnumsDemo {

    enum KycStatus {
        pending,
        DocUploaded,
        DocVerified,
        Completed,
        Rejected
        
    }

    KycStatus public status;
    
    constructor() {
        status = KycStatus.DocUploaded;

    }

    function getKycStatus() public view returns(KycStatus) {
        return status;

    }
    function setKycStatus(KycStatus _KycStatus) public {

        status = _KycStatus;

    }

    function setStatusAsRejected() public {
        status = KycStatus.Rejected;
    }

}
